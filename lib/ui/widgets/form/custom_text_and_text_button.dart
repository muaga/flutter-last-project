import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';

class CustomTextAndTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final String buttonText;
  final String routerLoad;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final TextStyle? buttonTextStyle;
  final Color? buttonTextColor;
  final Color? backgroundColor;

  const CustomTextAndTextButton(
      {required this.text,
      this.textStyle,
      this.textColor,
      required this.buttonText,
      required this.routerLoad,
      this.buttonWidth,
      this.buttonHeight,
      this.borderRadius,
      this.buttonTextStyle,
      this.buttonTextColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${text}",
          style: textStyle ?? body2(mColor: textColor ?? kFontBlack),
        ),
        const SizedBox(width: gapSmall),
        CustomRadiusColorButton(
          buttonText: buttonText,
          routerLoad: routerLoad,
          backgroundColor: backgroundColor,
          textStyle: buttonTextStyle,
          borderRadius: borderRadius,
          buttonHeight: buttonHeight,
          buttonWidth: buttonWidth,
          textColor: buttonTextColor,
        )
      ],
    );
  }
}
