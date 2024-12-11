import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'DMSerifDisplay',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.textColor,
      ),
      dividerColor: AppColors.borderColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor
          // titleTextStyle:
          ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.accentColor,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.redColor,
          ),
        ),
      ));
}
