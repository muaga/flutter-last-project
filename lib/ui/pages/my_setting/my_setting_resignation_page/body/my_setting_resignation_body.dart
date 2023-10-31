import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_state.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MySettingResignationBody extends StatelessWidget {
  const MySettingResignationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          Text("서재 이용 현황", style: subTitle2()),
          SizedBox(height: gapMedium),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kBackGray),
            ),
            child: Padding(
              padding: EdgeInsets.all(gapMain),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "호기심 많은 률률류의 서재",
                      style: subTitle2(),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: gapMain, bottom: gapMain),
                        child: CustomThinLine()),
                    MySettingResignationState(
                        title: "서재에 기록된 도서", quantity: 48, unit: "권"),
                    SizedBox(height: gapMain),
                    MySettingResignationState(
                        title: "서재에 기록된 포스트", quantity: 1, unit: "개")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: gapXlarge),
          CustomThinLine(),
          SizedBox(height: gapXlarge),
          Text("탈퇴 회원 유의 사항", style: subTitle3(mColor: kFontRed)),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
