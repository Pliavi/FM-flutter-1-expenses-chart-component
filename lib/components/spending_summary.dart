import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';

class SpendingSummary extends StatelessWidget {
  const SpendingSummary({
    Key? key,
    required this.spendings,
  }) : super(key: key);

  final Map<String, double> spendings;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final monthTotal =
        spendings.values.fold<double>(0.0, (sum, spending) => sum + spending);

    final Map<String, double> dayPercentage = {};

    for (final day in spendings.keys) {
      final amount = spendings[day]!;
      final double percentage = amount / monthTotal * 100 * 7;

      dayPercentage[day] = percentage.isNaN ? 0.0 : percentage;
    }

    return Container(
      decoration: BoxDecoration(
        color: CColors.paper,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spending - Last 7 days",
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: dayPercentage.keys
                  .map(
                    (day) => _SpendingColumn(
                      day,
                      spendings[day]!,
                      dayPercentage[day]!,
                    ),
                  )
                  .toList(),
            ),
          ),
          const Divider(color: CColors.borders, thickness: 2),
          Text("Total this month", style: textTheme.headlineSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$monthTotal", style: textTheme.displayMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("+2.4%", style: textTheme.bodyLarge),
                  Text(
                    "from last month",
                    style: textTheme.headlineSmall,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SpendingColumn extends StatefulWidget {
  const _SpendingColumn(
    this.day,
    this.value,
    this.percentage, {
    Key? key,
  }) : super(key: key);

  final double value;
  final double percentage;
  final String day;

  @override
  State<_SpendingColumn> createState() => _SpendingColumnState();
}

class _SpendingColumnState extends State<_SpendingColumn> {
  bool _isHovered = false;
  bool _isSelected = false;

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color color = _isSelected ? CColors.secondary : CColors.primary;

    if (_isHovered) {
      color = color.withOpacity(0.7);
    }

    return Expanded(
      child: InkWell(
        focusNode: _focusNode,
        canRequestFocus: true,
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            _focusNode.requestFocus();
          });
        },
        onHover: (isHovered) {
          setState(() {
            _isHovered = isHovered;
          });
        },
        onFocusChange: (hasFocus) {
          setState(() {
            _isSelected = hasFocus;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -30,
                  height: 28,
                  child: Visibility(
                    visible: _isHovered,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '\$${widget.value}',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.all(4),
                  height: (widget.percentage - 28).abs(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.day,
              style: textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
