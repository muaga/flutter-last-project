import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTitleInsert extends StatelessWidget {
  const CustomTitleInsert(
      {super.key,
      required this.titleController,
      this.hintText,
      required this.onChanged});

  final titleController;
  final String? hintText;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: subTitle1(),
      controller: titleController,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "${hintText}",
          hintStyle: subTitle1(mColor: kFontGray)),
      onChanged: onChanged,
      maxLines: null,
      maxLength: 80,
    );
  }
}
