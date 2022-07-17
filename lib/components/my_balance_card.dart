import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBalanceCard extends StatelessWidget {
  const MyBalanceCard({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
