import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.dmSansTextTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: textTheme.copyWith(
          headlineSmall: textTheme.headlineSmall?.copyWith(
            fontSize: 14,
            color: CColors.mediumBrown,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: textTheme.headlineMedium?.copyWith(
            color: CColors.darkBrown,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: textTheme.labelMedium?.copyWith(
            color: CColors.mediumBrown,
          ),
          bodyMedium: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          displaySmall: textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontSize: 28,
          ),
          displayMedium: textTheme.displayMedium?.copyWith(
            color: CColors.darkBrown,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ExpenseChart(),
    );
  }
}

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 375),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("My balance", style: textTheme.bodyMedium),
                          SizedBox(height: 8),
                          Text("\$921.48", style: textTheme.displaySmall),
                        ],
                      ),
                      SvgPicture.asset("assets/images/logo.svg"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
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
                )
              ],
            ),
          ),
        ),
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
