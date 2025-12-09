import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    const defaultLargeText = TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryBlue,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',

      textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 82,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryBlue,
          ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.textInputActive
        )
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgInput,
        labelStyle: const TextStyle(
          color: AppColors.textInputActive,
          fontSize: 18,
        ),
        hintStyle: const TextStyle(
          color: AppColors.textInputDesibled
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.borderInput,
            width: 2
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: AppColors.borderInput,
                width: 2
            )
        ),
      ),
    );
  }
}