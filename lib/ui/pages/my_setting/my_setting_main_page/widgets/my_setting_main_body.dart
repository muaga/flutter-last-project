import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/custom_title_and_subtitle_form.dart';

class MySettingMainBody extends StatelessWidget {
  const MySettingMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: gapXxlarge),
        Padding(
            padding: EdgeInsets.all(gapMain),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      child: iconPhone(),
                    ),
                    Text("휴대폰 계정 회원",
                        style: subTitle1().copyWith(color: kFontGray))
                  ],
                ),
                SizedBox(height: gapLarge),
                CustomTitleAndSubtitleForm(
                    title: "호기심 많은 률률류님",
                    subTitle: "독서는 배신하지 않아요!",
                    subTitleStyle: title1())
              ],
            )),
        SizedBox(height: gapLarge),
        Container(
            padding: EdgeInsets.all(gapMedium),
            color: kBackLightGray,
            alignment: Alignment.centerLeft,
            child:
                Text("서비스 설정", style: subTitle1().copyWith(color: kFontGray))),
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 정보 관리", style: subTitle1()),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: kFontLightGray,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("알림 설정", style: subTitle1()),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: kFontLightGray,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("회원탈퇴", style: subTitle1()),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: kFontLightGray,
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
