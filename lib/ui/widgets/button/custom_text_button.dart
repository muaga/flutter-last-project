import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class HyperLink extends StatelessWidget {
  final String buttonText;
  final String routerLoad;
  final TextStyle? textStyle;
  final Color? textColor;
  final FontWeight? fontWeight;

  const HyperLink(
      {required this.buttonText,
      required this.routerLoad,
      this.textStyle,
      this.textColor,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routerLoad);
      },
      child: Text(
        "${buttonText}",
        style: textStyle ??
            body2(
                mColor: textColor ?? kFontBlack,
                mFontWeight: fontWeight ?? FontWeight.bold),
      ),
    );
  }
}
