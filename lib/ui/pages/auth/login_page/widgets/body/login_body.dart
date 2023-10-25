import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/custom_title_and_subtitle_form.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/join_or_password_navigation_form.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/login_text_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleAndSubtitleForm(
            title: "독서와 무제한 친해지리",
            subTitle: "즐거운 독서 생활로 당신의 일상을",
            subTitleStyle:
                subTitle2(mColor: kFontGray, mFontWeight: FontWeight.w500),
          ),
          SizedBox(height: gapLarge),
          LoginTextForm(),
          SizedBox(height: gapMedium),
          JoinOrPasswordNavigationForm(text: "회원가입"),
          // SimpleLoginList(),
        ],
      ),
    );
  }
}
