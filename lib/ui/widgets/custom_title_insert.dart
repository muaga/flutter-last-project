import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTitleInsert extends StatelessWidget {
  const CustomTitleInsert({
    super.key,
    required this.titleController,
    this.hintText,
  });

  final TextEditingController titleController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: title1(),
      controller: titleController,
      decoration: InputDecoration(
          hintText: "${hintText}", hintStyle: title1(mColor: kFontGray)),
      maxLines: null,
      maxLength: 80,
    );
  }
}
