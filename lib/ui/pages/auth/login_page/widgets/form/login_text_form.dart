import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_out_line_text_form_field.dart';

class LoginTextForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomOutLineTextFormField(
            hintText: "아이디 입력",
            controller: _username,
            obscureText: false,
            funValidator: validateUsername()),
        SizedBox(height: gapMedium),
        CustomOutLineTextFormField(
            hintText: "비밀번호 입력",
            controller: _password,
            obscureText: true,
            funValidator: validatePassword()),
        SizedBox(height: gapLarge),
        CustomRadiusColorButton(
            buttonText: "로그인", routerLoad: Move.LoginPage, borderRadius: 5),
        SizedBox(height: gapXlarge),
      ]),
    );
  }
}
