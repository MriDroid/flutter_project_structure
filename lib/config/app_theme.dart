import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders_system/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      // For Divider
      outlineVariant: Colors.grey.withOpacity(0.5),
      // For Text Field
      outline: Colors.grey.withOpacity(0.75),
    ),
    elevatedButtonTheme: _elevatedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    appBarTheme: _appBarTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

TextButtonThemeData _textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
    prefixIconColor: Colors.black,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    hintStyle: TextStyle(
      fontSize: 14.sp,
    ),
  );
}

class AppTextSize {
  static TextStyle textSize9 = TextStyle(fontSize: 9.sp);
  static TextStyle textSize10 = TextStyle(fontSize: 10.sp);
  static TextStyle textSize12 = TextStyle(fontSize: 12.sp);
  static TextStyle textSize14 = TextStyle(fontSize: 14.sp);
  static TextStyle textSize16 = TextStyle(fontSize: 16.sp);
  static TextStyle textSize18 = TextStyle(fontSize: 18.sp);
  static TextStyle textSize20 = TextStyle(fontSize: 20.sp);
  static TextStyle textSize22 = TextStyle(fontSize: 22.sp);
  static TextStyle textSize24 = TextStyle(fontSize: 24.sp);
  static TextStyle textSize26 = TextStyle(fontSize: 26.sp);
  static TextStyle textSize28 = TextStyle(fontSize: 28.sp);
  static TextStyle textSize30 = TextStyle(fontSize: 30.sp);
  static TextStyle textSize32 = TextStyle(fontSize: 32.sp);
}
