import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_next_button.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form_and_validator_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinIdEmailBody extends ConsumerWidget {
  final _formkey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();

  JoinIdEmailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormAndValidatorButton(
                    title: "아이디 입력",
                    hintText: "아이디 입력",
                    buttonText: "중복체크",
                    guideText: "영문 또는 영문과 숫자의 조합으로 입력해주세요",
                    controller: _username,
                    funValidator: _username,
                    obscureText: false,
                  ),
                  const SizedBox(height: gapXxlarge),
                  CustomTextForm(
                    title: "email 입력",
                    hintText: "email 입력",
                    funValidator: _email,
                    obscureText: false,
                    controller: _email,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNextButton(
              buttontext: "다음",
              funPageRoute: () {
                if (_formkey.currentState!.validate()) {
                  JoinIdAndEmailRequestDTO joinReqDTO =
                      JoinIdAndEmailRequestDTO(
                          username: _username.text, email: _email.text);
                  ref.read(sessionStore).join(joinReqDTO);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
