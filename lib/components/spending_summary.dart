import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';

class SpendingSummary extends StatelessWidget {
  const SpendingSummary({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _SpendingColumn("mon", 30),
              _SpendingColumn("tue", 50),
              _SpendingColumn("wed", 100, active: true),
              _SpendingColumn("thu", 45),
              _SpendingColumn("fri", 40),
              _SpendingColumn("sat", 60),
              _SpendingColumn("sun", 42),
            ],
          ),
          Divider(color: CColors.borders, thickness: 2),
          Text("Total this month", style: textTheme.headlineSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$478.33", style: textTheme.displayMedium),
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

class _SpendingColumn extends StatelessWidget {
  const _SpendingColumn(
    this.day,
    this.value, {
    Key? key,
    this.active = false,
  }) : super(key: key);

  final double value;
  final bool active;
  final String day;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: active ? CColors.secondary : CColors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.all(4),
            height: value,
          ),
          Text(
            day,
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
