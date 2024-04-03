import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_mina/core/utils/app_color.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: const BorderSide(color: AppColors.lightWhite, width: 1),
      ),
      backgroundColor: AppColors.lightWhite,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Segoe Ui',
        fontSize: 50.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightColor,
      ),
      bodyLarge: GoogleFonts.balooThambi2(
        fontSize: 32.sp,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.balooThambi2(
        fontSize: 20.sp,
        color: AppColors.lightColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 27.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.hintColor,
      ),
      //error style
      labelSmall: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.red,
      ),
      displayMedium: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
  );
}
