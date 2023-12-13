import 'package:flutter/cupertino.dart';

class AppColors {
  static const lightsky = Color(0xFFA6C0FF);
  static const whiteshade = Color(0xFFF8F9FA);
  static const blue = Color(0xFF497fff);
  static const lightblueshade = Color(0xFF758CC8);
  static const grayshade = Color(0xFFEBEBEB);
  static const lightblue = Color(0xFF4B68D1);
  static const blackshade = Color(0xFF555555);
  static const hintText = Color(0xFFC7C7CD);
  static const error = Color(0xFFB00020);
    static const  caption = Color(0xFF555555);

    static LinearGradient get whiteGradient => const LinearGradient(colors: [
        Color(0xffE5E6E4),
        Color(0xffECECEB),
        Color(0xffF2F3F2),
        Color(0xffF9F9F8),
        Color(0xffE5E6E4),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  
  static const GREYSCALE_MATRIX = [
    0.2126,
    0.7152,
    0.0722,
    0.0,
    0.0,
    0.2126,
    0.7152,
    0.0722,
    0.0,
    0.0,
    0.2126,
    0.7152,
    0.0722,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0
  ];
}
