import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/custom_title_and_subtitle_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_member_type_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_no_sub_scription_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_yes_sub_scription_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_gray_form.dart';
import 'package:logger/logger.dart';

class MySettingMainBody extends StatelessWidget {
  const MySettingMainBody({super.key});

  /// 구독권의 유무
  // TODO 은혜 : 구독권을 bool로 할 지 결정
  final bool subScription = false;

  @override
  Widget build(BuildContext context) {
    /// 구독권이 있을 때
    if (subScription == true) {
      return ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(gapMain),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySettingMainMemberTypeForm(),
                  SizedBox(height: gapLarge),
                  Text("호기심 많은 률률류님", style: title1()),
                  const SizedBox(height: gapLarge),
                  MySettingMainYesSubScriptionForm(
                    startDuration: "2021.06.18",
                    endDuration: "2023.08.16",
                    paymentDate: "2023.08.06",
                  ),
                ],
              )),
          const SizedBox(height: gapMedium),
          CustomTitleGrayForm(title: "서비스 설정"),
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Column(
              children: [
                CustomTitleAndForwordForm(
                  title: "내 정보 관리",
                  textStyle: subTitle2(),
                  funPageRoute: () {
                    Navigator.pushNamed(context, Move.MySettingProfilePage);
                    Logger().d("이동");
                  },
                ),
                CustomTitleAndForwordForm(
                  title: "회원 탈퇴",
                  textStyle: subTitle2(),
                  funPageRoute: () {
                    Navigator.pushNamed(context, Move.MySettingResignationPage);
                  },
                ),
              ],
            ),
          )
        ],
      );
    } else {
      /// 구독권이 없을 때
      return ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(gapMain),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySettingMainMemberTypeForm(),
                  SizedBox(height: gapLarge),
                  CustomTitleAndSubtitleForm(
                      title: "호기심 많은 률률류님",
                      subTitle: "독서는 배신하지 않아요!",
                      subTitleStyle: title1()),
                  const SizedBox(height: gapLarge),
                  MySettingMainNoSubScriptionForm(),
                  const SizedBox(height: gapSmall),
                  CustomRadiusColorButton(
                    buttonText: "구독 시작하기",
                    textStyle: subTitle2(mFontWeight: FontWeight.w500),
                    funPageRoute: () {},
                    borderRadius: 5,
                    buttonHeight: 50,
                  )
                ],
              )),
          const SizedBox(height: gapMedium),
          CustomTitleGrayForm(title: "서비스 설정"),
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Column(
              children: [
                CustomTitleAndForwordForm(
                    title: "내 정보 관리",
                    textStyle: subTitle2(),
                    funPageRoute: () {
                      Navigator.pushNamed(context, Move.MySettingProfilePage);
                      Logger().d("이동");
                    }),
                CustomTitleAndForwordForm(
                  title: "회원 탈퇴",
                  textStyle: subTitle2(),
                  funPageRoute: () {
                    Navigator.pushNamed(context, Move.MySettingResignationPage);
                  },
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
