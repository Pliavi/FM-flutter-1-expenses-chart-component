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
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.dmSansTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.dmSansTextTheme().bodyText2?.copyWith(
                fontSize: 18,
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("My balance"),
                          SizedBox(height: 8),
                          Text("\$921,48"),
                        ],
                      ),
                      SvgPicture.asset("assets/images/logo.svg"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Spending - Last 7 days"),
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
                      Divider(color: CColors.borders, thickness: 3),
                      Text("Total this month"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$478.33"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("+2.4%"),
                              Text("from last month"),
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
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: active ? CColors.secondary : CColors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.all(8),
            height: value,
          ),
          Text(day),
        ],
      ),
    );
  }
}
