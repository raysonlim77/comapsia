import 'package:flutter/material.dart';

import 'app_colors.dart';

class KTextStyle {
  
  static const textFieldHeading =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static const textFieldHintStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w500);

  static const authButtonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.whiteshade);

  static const displayLarge =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static const displayMedium =
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static const displaySmall =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const headlineLarge =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const headlineMedium =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const headlineSmall =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const titleLarge =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const titleMedium =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const titleSmall =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const bodyLarge = TextStyle(fontSize: 18);
  static const bodyMedium = TextStyle(fontSize: 16);
  static const bodySmall = TextStyle(fontSize: 14);
  static const labelLarge = TextStyle(fontSize: 16, color: Colors.blue);
  static const labelMedium = TextStyle(fontSize: 14, color: Colors.blue);
  static const labelSmall = TextStyle(fontSize: 12, color: Colors.blue);
}
