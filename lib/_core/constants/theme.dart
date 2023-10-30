import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "NanumSquare", // 앱의 폰트
    appBarTheme: AppBarTheme(
      // 앱의 AppBar 공통 테마
      backgroundColor: kBackWhite,
      foregroundColor: kFontBlack,
      elevation: 0.0,
      titleTextStyle: subTitle1(),
      centerTitle: true,
    ),

    /// elevated 버튼
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: subTitle2(),
        backgroundColor: kPrimaryColor,
        foregroundColor: kFontBlack,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 60),
      ),
    ),

    /// Scaffold 기본 배경 컬러
    scaffoldBackgroundColor: kBackWhite,
  );
}
