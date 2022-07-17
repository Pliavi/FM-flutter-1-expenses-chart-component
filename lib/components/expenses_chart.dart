import 'package:expense_chart_component/components/my_balance_card.dart';
import 'package:expense_chart_component/components/spending_summary.dart';
import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';

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
                MyBalanceCard(textTheme: textTheme),
                const SizedBox(height: 16),
                SpendingSummary(textTheme: textTheme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
