import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomTitleAndSubtitleForm extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle subTitleStyle;
  final Color? titleColor;
  const CustomTitleAndSubtitleForm(
      {required this.title,
      required this.subTitle,
      required this.subTitleStyle,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: title1(mColor: titleColor ?? kFontBlack)),
      SizedBox(height: gapSmall),
      Text(
        subTitle,
        style: subTitleStyle,
      ),
    ]);
  }
}
