import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

/// 타이틀 폰트 = title
TextStyle title1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 24, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 서브 타이틀 폰트 = subtitle
TextStyle subTitle1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 18, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle2(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 16, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle3(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 본문 폰트 = body
TextStyle body1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 13, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle body2(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle body3(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle body4(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 11.5, fontWeight: mFontWeight, color: mColor, height: 1.4);
}
