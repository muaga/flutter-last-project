import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final controller;

  const CustomTextArea({
    Key? key,
    required this.hint,
    required this.funValidator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: subTitle2(mFontWeight: FontWeight.normal),
        controller: controller,
        maxLines: 20,
        validator: funValidator,
        decoration:
            InputDecoration(hintText: "$hint", border: InputBorder.none),
      ),
    );
  }
}
