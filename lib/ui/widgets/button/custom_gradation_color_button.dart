import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomGradationColorButton extends StatelessWidget {
  final buttonText;
  final String routerLoad;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;

  const CustomGradationColorButton(
      {required this.buttonText,
      required this.routerLoad,
      this.buttonWidth,
      this.buttonHeight,
      this.borderRadius,
      this.textStyle,
      this.gradientStartColor,
      this.gradientEndColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 80),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            gradientStartColor ?? kPrimaryColor,
            gradientEndColor ?? kPrimaryColor
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routerLoad);
        },
        child: Text(
          "${buttonText}",
          style: textStyle ?? subTitle2(), // 텍스트 세로 가운데 정렬
        ),
      ),
    );
  }
}
