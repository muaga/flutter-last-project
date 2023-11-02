import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_choice_page/my_setting_resignation_choice_page.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/form/my_setting_resignation_all_state_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/form/my_setting_resignation_notice_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_two_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_check_box_and_title_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MySettingResignationBody extends StatelessWidget {
  const MySettingResignationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("서재 이용 현황", style: subTitle2()),
              SizedBox(height: gapMedium),
              MySettingResignationAllStateForm(),
              SizedBox(height: gapXlarge),
              CustomThinLine(),
              SizedBox(height: gapXlarge),
              MySettingResignationNoticeForm(), // 탈퇴 유의사항
              SizedBox(height: gapLarge),
              CustomCheckBoxAndTitleForm(
                color: Colors.transparent,
                title: "회원 탈퇴에 관한 모든 내용을 숙지하였고, 회원 탈퇴를 신청합니다.",
                fontStyle:
                    subTitle3(mColor: kFontGray, mFontWeight: FontWeight.w500),
              ),
              SizedBox(height: gapXlarge),
            ],
          ),
          MySettingResignationTwoButton(
            yellowButtonText: "계속 진행하기",
            funPageRoute: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MySettingResignationChoicePage(userId: user.id);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
