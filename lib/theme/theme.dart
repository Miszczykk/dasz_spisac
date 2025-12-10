import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',

      textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 82,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBlue,
          ),
          displayMedium: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.normal,
            color: AppColors.secondaryBlue,
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryBlue,
          ),


        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryBlue,
        ),

        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.textInputActive
        ),

        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryBlue
        ),

          labelLarge: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: AppColors.textInputActive
          ),
          labelMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textInputActive
          ),
          labelSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.secondaryBlue
          )
      ),

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.textInputDesibled,
        selectionHandleColor: AppColors.textInputDesibled,
        selectionColor: AppColors.textInputDesibled
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgInput,
        labelStyle: const TextStyle(
          color: AppColors.textInputDesibled,
          fontSize: 18,
          fontWeight: FontWeight.normal
        ),
        hintStyle: const TextStyle(
          color: AppColors.textInputDesibled,
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

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bgButtonActive,
          foregroundColor: AppColors.bgButtonTextActive,
            minimumSize: const Size(double.infinity, 75),
          textStyle: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10.0))
        ),
      )
    );
  }
}