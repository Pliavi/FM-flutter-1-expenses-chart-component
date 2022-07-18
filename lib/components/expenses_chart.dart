import 'dart:convert';

import 'package:expense_chart_component/components/my_balance_card.dart';
import 'package:expense_chart_component/components/spending_summary.dart';
import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({Key? key}) : super(key: key);

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  Map<String, double> _spendings = {
    'mon': 0.0,
    'tue': 0.0,
    'wed': 0.0,
    'thu': 0.0,
    'fri': 0.0,
    'sat': 0.0,
    'sun': 0.0,
  };

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
                const MyBalanceCard(),
                const SizedBox(height: 16),
                SpendingSummary(spendings: _spendings),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchData() async {
    const String jsonUrl = 'assets/data/data.json';
    final String jsonString = await rootBundle.loadString(jsonUrl);
    final List<dynamic> data = await json.decode(jsonString);
    final Map<String, double> newData = {};

    for (final spending in data) {
      final day = spending['day'];
      final amount = spending['amount'];

      newData[day] = amount;
    }

    _spendings = newData;
    setState(() {});
  }
}
