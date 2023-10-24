import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class OutLineTextFormField extends StatelessWidget {
  final hintText;
  final bool isPassword;
  final TextEditingController controller;

  const OutLineTextFormField(
      {required this.hintText,
      this.isPassword = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: body2(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: kFontLightGray),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFontLightGray, width: 0.6)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFontBlack, width: 0.6)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFontLightGray, width: 0.6)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFontLightGray, width: 0.6)),
      ),
    );
  }
}
