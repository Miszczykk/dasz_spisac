import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/colors.dart';
import 'package:dasz_spisac/theme/fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFonts.h1(context),
          fontWeight: FontWeight.w500,
          color: AppColors.primaryBlue,
        ),
        displayMedium: TextStyle(
          fontSize: AppFonts.h2(context),
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryBlue,
        ),
        displaySmall: TextStyle(
          fontSize: AppFonts.h3(context),
          fontWeight: FontWeight.normal,
          color: AppColors.primaryBlue,
        ),

        headlineSmall: TextStyle(
          fontSize: AppFonts.h3(context),
          fontWeight: FontWeight.normal,
          color: AppColors.primaryBlue,
        ),

        bodyLarge: TextStyle(
          fontSize: AppFonts.h3(context),
          fontWeight: FontWeight.normal,
          color: AppColors.textInputActive,
        ),
        bodyMedium: TextStyle(
          fontSize: AppFonts.h5(context),
          fontWeight: FontWeight.normal,
          color: AppColors.bgButtonTextActive,
        ),
        bodySmall: TextStyle(
          fontSize: AppFonts.h4(context),
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryBlue,
        ),

        labelLarge: TextStyle(
          fontSize: AppFonts.h2(context),
          fontWeight: FontWeight.bold,
          color: AppColors.textInputActive,
        ),
        labelMedium: TextStyle(
          fontSize: AppFonts.h3a(context),
          fontWeight: FontWeight.bold,
          color: AppColors.textInputActive,
        ),
        labelSmall: TextStyle(
          fontSize: AppFonts.h4(context),
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryBlue,
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.textInputDesibled,
        selectionHandleColor: AppColors.textInputDesibled,
        selectionColor: AppColors.textInputDesibled,
      ),

      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.textInputDesibled, //TODO: don't work
        filled: true,
        fillColor: AppColors.bgInput,
        labelStyle: TextStyle(
          color: AppColors.textInputDesibled,
          fontSize: AppFonts.h3(context),
          fontWeight: FontWeight.normal,
        ),
        hintStyle: const TextStyle(color: AppColors.textInputDesibled),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.borderInput, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.borderInput, width: 2),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bgButtonActive,
          foregroundColor: AppColors.bgButtonTextActive,
          minimumSize: const Size(double.infinity, 75),
          textStyle: TextStyle(
            fontSize: AppFonts.h2(context),
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10.0),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.primaryBlue),
    );
  }
}
