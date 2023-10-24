import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_next_button.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form_and_validator_button.dart';

class JoinIdEmailBody extends StatelessWidget {
  const JoinIdEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                      guideText: "영문 또는 영문과 숫자의 조합으로 입력해주세요"),
                  const SizedBox(height: gapXxlarge),
                  CustomTextForm(
                    title: "email 입력",
                    hintText: "email 입력",
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNextButton(),
          ),
        ),
      ],
    );
  }
}
