import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomOutLineTextFormField extends StatelessWidget {
  final hintText;
  final bool obscureText;
  final funValidator;
  final TextEditingController controller;

  const CustomOutLineTextFormField(
      {required this.hintText,
      this.obscureText = false,
      required this.funValidator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: funValidator,
      obscureText: obscureText,
      style: body1(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: kFontLightGray, fontSize: 15),
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
