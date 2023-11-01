import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomTitleGrayForm extends StatelessWidget {
  const CustomTitleGrayForm({super.key, required this.title, this.textStyle});

  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: gapXlarge, top: gapMedium, bottom: gapMedium),
        color: kBackLightGray,
        alignment: Alignment.centerLeft,
        child: Text("${title}",
            style: textStyle ?? subTitle2().copyWith(color: kFontGray)));
  }
}
