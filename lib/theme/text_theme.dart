import 'package:expense_chart_component/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CTextTheme {
  static TextTheme getCustomTextTheme() {
    final textTheme = GoogleFonts.dmSansTextTheme();

    return textTheme.copyWith(
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
    );
  }
}
