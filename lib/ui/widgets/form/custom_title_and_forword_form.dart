import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomTitleAndForwardForm extends StatelessWidget {
  const CustomTitleAndForwardForm(
      {super.key,
      required this.title,
      required this.funPageRoute,
      this.textStyle,
      this.fontWeight,
      this.fontColor});

  final String title;
  final Color? fontColor;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final funPageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${title}",
                style: textStyle ??
                    subTitle1(
                        mColor: fontColor ?? kFontBlack,
                        mFontWeight: fontWeight ?? FontWeight.bold),
              ),
              IconButton(
                onPressed: funPageRoute,
                icon: iconArrowForward(),
              ),
            ],
          )),
    );
  }
}
