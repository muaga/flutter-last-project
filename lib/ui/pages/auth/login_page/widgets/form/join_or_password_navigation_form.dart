import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/widgets/button/custom_text_button.dart';

class JoinOrPasswordNavigationForm extends StatelessWidget {
  final String text;
  const JoinOrPasswordNavigationForm({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextButton(
            buttonText: "회원가입",
            routerLoad: Move.JoinPage,
            textStyle: body1(mColor: kFontGray)),

        /// TODO : 3단계 = 비밀번호 찾기 시
        // _buildColumnLine(),
        // CustomTextButton(
        //     buttonText: "비밀번호 찾기",
        //     routerLoad: Move.BookDetailPage,
        //     textStyle: body1(mColor: kFontGray) // 비밀번호 찾기 페이지로,
        //     ),
      ],
    );
  }

  Widget _buildColumnLine() {
    return Container(
      height: 15,
      width: 1.0,
      color: kBackGray,
    );
  }
}
