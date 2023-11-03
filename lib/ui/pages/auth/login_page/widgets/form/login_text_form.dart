import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/feed_main_page.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_out_line_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginTextForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginTextForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          buttonText: "로그인",
          borderRadius: 5,
          funPageRoute: () {
            if (_formKey.currentState!.validate()) {
              LoginRequestDTO loginReqDTO = LoginRequestDTO(
                  // username: _username.text, password: _password.text);
                  username: _username.text,
                  password: _password.text);
              ref.read(sessionStore).login(loginReqDTO);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedMainPage()));
            }
          },
        ),
        SizedBox(height: gapXlarge),
      ]),
    );
  }
}
