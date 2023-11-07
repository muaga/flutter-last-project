import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/form/checkBox_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form_and_validator_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinBody extends ConsumerWidget {
  final _formkey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _nickname = TextEditingController();

  JoinBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: ListView(
          children: [
            CustomTextForm(
              title: "아이디 입력",
              hintText: "아이디 입력",
              controller: _username,
              funValidator: validateUsername(),
              guideText: "영문 또는 영문과 숫자의 조합으로 입력해 주세요.",
            ),
            const SizedBox(height: gapLarge),
            CustomThinLine(),
            const SizedBox(height: gapLarge),
            CustomTextForm(
              title: "email 입력",
              hintText: "email 입력",
              controller: _email,
              funValidator: validateEmail(),
              guideText: "영문과 숫자를 포함하여 이메일 주소를 입력해 주세요.",
            ),
            const SizedBox(height: gapLarge),
            CustomThinLine(),
            const SizedBox(height: gapLarge),
            CustomTextForm(
              title: "로그인 시 사용할 비밀번호",
              hintText: "비밀번호 입력",
              guideText: "영문, 숫자를 포함한 4~12자 조합으로 입력해 주세요.",
              controller: _password,
              obscureText: true,
              funValidator: validatePassword(),
            ),
            const SizedBox(height: gapLarge),
            CustomThinLine(),
            const SizedBox(height: gapLarge),
            CustomTextForm(
              title: "닉네임",
              hintText: "닉네임 입력",
              guideText: "닉네임 설정한 회원이 독서 습관 갖기에 성공할 확률이 높아요.",
              controller: _nickname,
              funValidator: validateNickname(),
            ),
            const SizedBox(height: gapLarge),
            CustomThinLine(),
            const SizedBox(height: gapLarge),
            Text("약관 동의", style: subTitle2(mColor: kFontGray)),
            const SizedBox(height: gapLarge),
            CheckBoxGroup(),
            const SizedBox(height: gapLarge),
            CustomBottomButton(
              funPageRoute: () {
                if (_formkey.currentState!.validate()) {
                  JoinRequestDTO requestDTO = JoinRequestDTO(
                      username: _username.text,
                      email: _email.text,
                      password: _password.text,
                      nickname: _nickname.text);
                  ref.read(sessionStore).join(requestDTO);
                }
              },
              buttonText: "회원가입완료",
            )
          ],
        ),
      ),
    );
  }
}
