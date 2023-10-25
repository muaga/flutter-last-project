import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_out_line_text_form_field.dart';

class CustomLoginTextForm extends StatelessWidget {
  final TextEditingController controller;

  const CustomLoginTextForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomOutLineTextFormField(hintText: "아이디 입력", controller: controller),
      SizedBox(height: gapMedium),
      CustomOutLineTextFormField(
          hintText: "비밀번호", isPassword: true, controller: controller),
      SizedBox(height: gapMedium),
      ElevatedButton(onPressed: () {}, child: Text("로그인"))
    ]);
  }
}
