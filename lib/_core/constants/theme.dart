import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "NanumSquare", // 앱의 폰트
    appBarTheme: AppBarTheme(
      // 앱의 AppBar 공통 테마
      backgroundColor: kBackWhite,
      elevation: 0.0,
      titleTextStyle: subTitle1(),
      centerTitle: true,
    ),
  );
}
