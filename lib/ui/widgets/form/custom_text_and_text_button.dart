import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/button/custom_text_button.dart';

class CustomTextAndTextButton extends StatelessWidget {
  final String text;
  final String buttonText;
  final String routerLoad;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? buttonTextColor;
  final FontWeight? buttonFontWeight;
  final FontWeight? fontWeight;
  final TextStyle? buttonTextStyle;

  const CustomTextAndTextButton(
      {required this.text,
      required this.buttonText,
      required this.routerLoad,
      this.textStyle,
      this.textColor,
      this.buttonTextColor,
      this.buttonFontWeight,
      this.fontWeight,
      this.buttonTextStyle});

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
        CustomTextButton(
            buttonText: buttonText,
            routerLoad: routerLoad,
            textColor: buttonTextColor,
            fontWeight: buttonFontWeight,
            textStyle: buttonTextStyle),
      ],
    );
  }
}
