import 'package:expense_chart_component/components/expenses_chart.dart';
import 'package:expense_chart_component/theme/text_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = CTextTheme.getCustomTextTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: textTheme, useMaterial3: true),
      home: const ExpenseChart(),
    );
  }
}
