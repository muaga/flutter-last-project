import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTitleInsert extends StatelessWidget {
  const CustomTitleInsert({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: title1(),
      controller: titleController,
      decoration: InputDecoration(
          hintText: "제목을 입력하세요.", hintStyle: title1(mColor: kFontGray)),
      maxLines: null,
      maxLength: 80,
    );
  }
}
