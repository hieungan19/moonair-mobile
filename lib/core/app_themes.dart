import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class CustomTextStyle extends TextStyle {
  static TextStyle h1(Color color) {
    return GoogleFonts.nunito(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle h2(Color color) {
    return GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle h3(Color color) {
    return GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p1(Color color) {
    return GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p1bold(Color color) {
    return GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p2(Color color) {
    return GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p2bold(Color color) {
    return GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p3(Color color) {
    return GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p3bold(Color color) {
    return GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle p4(Color color) {
    return GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.5);
  }

  static TextStyle button(Color color) {
    return GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
    ),
  );
}
