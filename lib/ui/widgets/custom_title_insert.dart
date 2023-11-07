import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTitleInsert extends StatelessWidget {
  const CustomTitleInsert(
      {super.key, required this.titleController, this.hintText});

  final titleController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: subTitle1(),
      controller: titleController,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "${hintText}",
          hintStyle: subTitle1(mColor: kFontGray)),
      maxLines: null,
      maxLength: 80,
    );
  }
}
