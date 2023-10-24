import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/out_line_text_form_field.dart';

class CustomTextForm extends StatelessWidget {
  final String title;
  final String hintText;

  const CustomTextForm({required this.title, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: subTitle1(mColor: kFontGray)),
        SizedBox(height: gapMedium),
        OutLineTextFormField(hintText: hintText)
      ],
    );
  }
}
