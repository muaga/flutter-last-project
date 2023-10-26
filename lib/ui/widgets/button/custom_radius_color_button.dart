import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomRadiusColorButton extends StatelessWidget {
  final String buttonText;
  final funPageRoute;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;

  const CustomRadiusColorButton(
      {required this.buttonText,
      required this.funPageRoute,
      this.buttonWidth,
      this.buttonHeight,
      this.borderRadius,
      this.textStyle,
      this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funPageRoute,
      child: Text(
        "${buttonText}",
        style: textStyle ?? subTitle2(mColor: textColor ?? kFontBlack),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kPrimaryColor,
          minimumSize: Size(buttonWidth ?? double.infinity, buttonHeight ?? 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
          )),
    );
  }
}
