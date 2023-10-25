import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_out_line_text_form_field.dart';

class CustomTextFormAndValidatorButton extends StatelessWidget {
  final String title;
  final String hintText;
  final String buttonText;
  final String? guideText;
  final TextEditingController controller;

  const CustomTextFormAndValidatorButton(
      {required this.title,
      required this.hintText,
      required this.buttonText,
      this.guideText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: subTitle1(mColor: kFontGray)),
        SizedBox(height: gapMedium),
        Row(
          children: [
            Container(
                width: 230,
                child: CustomOutLineTextFormField(
                    hintText: hintText, controller: controller)),
            const SizedBox(width: gapMedium),
            ElevatedButton(
                onPressed: () {},
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minimumSize: Size(120, 60),
                )),
          ],
        ),
        const SizedBox(height: gapSmall),
        Text(guideText ?? "", style: TextStyle(color: kFontLightGray)),
      ],
    );
  }
}
