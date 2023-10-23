import 'package:flutter/material.dart';

/// gap size
const double gapMain = 16.0; // Scaffold Padding

const double gapSmall = 5.0;
const double gapMedium = 10.0;
const double gapLarge = 20.0;
const double gapXlarge = 30.0;
const double gapXxlarge = 50.0;

/// 화면 최대 width
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 화면 최대 height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Drawer width -> 책 독서 화면에서 사용
double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
