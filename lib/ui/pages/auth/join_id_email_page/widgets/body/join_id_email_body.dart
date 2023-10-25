import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_checkBox.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
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
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          CustomTextFormAndValidatorButton(
            title: "아이디 입력",
            hintText: "아이디 입력",
            buttonText: "중복확인",
            guideText: "영문 또는 영문과 숫자의 조합으로 입력해주세요",
            controller: _username,
          ),
          const SizedBox(height: gapXxlarge),
          CustomThinLine(),
          const SizedBox(height: gapXxlarge),
          CustomTextForm(
            title: "email 입력",
            hintText: "email 입력",
            controller: _email,
          ),
          const SizedBox(height: gapXlarge),
          CustomThinLine(),
          const SizedBox(height: gapXxlarge),
          CustomTextForm(
            title: "로그인시 사용할 비밀번호",
            hintText: "비밀번호 입력",
            guideText: "영문 숫자를 포함한 8~16자 조합으로 입력해 주세요.",
            controller: _email,
          ),
          CustomTextForm(
            hintText: "비밀번호 재입력",
            guideText: "영문 숫자를 포함한 8~16자 조합으로 입력해 주세요.",
            controller: _email,
          ),
          const SizedBox(height: gapXxlarge),
          CustomThinLine(),
          const SizedBox(height: gapXxlarge),
          CustomTextFormAndValidatorButton(
            title: "닉네임",
            hintText: "닉네임 입력",
            buttonText: "중복확인",
            guideText: "닉네임 설정한 회원이 독서 습관 갖기에 성공할 확률이 높아요.",
            controller: _username,
          ),
          const SizedBox(height: gapXxlarge),
          CustomThinLine(),
          const SizedBox(height: gapXxlarge),
          Text("약관 동의", style: subTitle1(mColor: kFontGray)),
          const SizedBox(height: gapLarge),
          SizedBox(
            width: double.infinity, // 레이아웃의 가로 공간을 다 사용
            height: 250.0, // 원하는 높이
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBackGray, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CheckboxExample(),
                      Text('전체 동의하기'),
                    ],
                  ),
                  CustomThinLine(),
                  Row(
                    children: [
                      CheckboxExample(),
                      Text('(필수) 만14세 이상'),
                    ],
                  ),
                  Row(
                    children: [
                      CheckboxExample(),
                      Text('(필수) 밀리의 서재 이용약관 동의'),
                    ],
                  ),
                  Row(
                    children: [
                      CheckboxExample(),
                      Text('(필수) 개인정보 처리방침 동의'),
                    ],
                  ),
                  Row(
                    children: [
                      CheckboxExample(),
                      Text('(선택) 도서추천, 신간도식 등 알림 수신'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
