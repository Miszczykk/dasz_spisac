import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Gradient bgColor = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFF95D2E5)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static const Color primaryBlue = Color(0xFF102A43);
  static const Color secondaryBlue = Color(0xFF486581);

  static const Color bgButtonActive = Color(0xFF334E68);
  static const Color bgButtonDesibled = Color(0xFFBCCCDC);
  static const Color bgButtonTextActive = Color(0xFFFFFFFF);
  static const Color bgButtonTextDesibled = Color(0xFFF0F4F8);

  static const Color bgInput = Color(0xFFF0F4F8);
  static const Color borderInput = Color(0xFF6587A9);
  static const Color textInputActive = Color(0xFF102A43);
  static const Color textInputDesibled = Color(0xFF829AB1);

  static const Color bgFrame = Color(0xFFFFFFFF);
  static const Color bgExtension = Color(0xFFF0F4F8);
  static const Color textExtension = Color(0xFF486581);

  static const Color red = Color(0xFFD64545);
  static const Color green = Color(0xFF048768);
  static const Color gray = Color(0xFF627D98);
}
