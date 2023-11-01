import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomSubScriptionForm extends StatelessWidget {
  const CustomSubScriptionForm(
      {super.key, required this.title, this.buttonText, this.buttonTextColor});

  final String title;
  final String? buttonText;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${title}", style: subTitle2(mFontWeight: FontWeight.w600)),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/mySettingSubScription");
          },
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: gapMedium),
          ),
          child: Row(
            children: [
              Text("${buttonText} ",
                  style: body2(
                      mFontWeight: FontWeight.w500,
                      mColor: buttonTextColor ?? kFontBlack)),
              iconArrowForward(mSize: 10),
            ],
          ),
        ),
      ],
    );
  }
}
