import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_text_and_text_button.dart';

class LoginOrJoinForm extends StatelessWidget {
  const LoginOrJoinForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomRadiusColorButton(
          buttonText: "첫 달 무료로 시작하기",
          funPageRoute: () {
            Navigator.pushNamed(context, Move.JoinPage);
          },
          buttonHeight: 50),
      SizedBox(height: gapLarge),
      CustomTextAndTextButton(
        text: "이미 밀리 회원이라면?",
        textStyle: body1(mColor: kFontLightGray, mFontWeight: FontWeight.w500),
        buttonText: "로그인",
        buttonTextStyle: body1(
          mColor: kFontWhite,
        ),
        routerLoad: Move.LoginPage,
      ),
    ]);
  }
}
