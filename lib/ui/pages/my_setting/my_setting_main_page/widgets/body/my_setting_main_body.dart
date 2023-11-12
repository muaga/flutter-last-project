import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_member_type_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_no_sub_scription_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/form/my_setting_main_yes_sub_scription_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_gray_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class MySettingMainBody extends ConsumerWidget {
  const MySettingMainBody({Key? key});

  /// 구독권의 유무
  // TODO 은혜 : 구독권을 bool로 할 지 결정
  final bool subScription = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySettingMainMemberTypeForm(),
              const SizedBox(height: gapLarge),
              Text("호기심 많은 률률류님", style: title1()),
              const SizedBox(height: gapLarge),

              /// 구독권 유무에 따라 아래의 화면이 바뀐다.
              if (subScription)
                MySettingMainYesSubScriptionForm(
                  startDuration: "2021.06.18",
                  endDuration: "2023.08.16",
                  paymentDate: "2023.08.06",
                )
              else
                Column(children: [
                  MySettingMainNoSubScriptionForm(),
                  const SizedBox(height: gapSmall),
                  CustomRadiusColorButton(
                    buttonText: "구독 시작하기",
                    textStyle: subTitle2(mFontWeight: FontWeight.w500),
                    funPageRoute: () {
                      Navigator.pushNamed(context, Move.MySettingPaymentPage);
                    },
                    borderRadius: 5,
                    buttonHeight: 60,
                  )
                ]),
            ],
          ),
        ),
        const SizedBox(height: gapMedium),
        MySettingServiceSettingList(), // 서비스 설정 목록
        MySettingServiceAboutList(), // 서비스 안내 목록
        Padding(
            padding: const EdgeInsets.all(gapMain),
            child: CustomRadiusColorButton(
              funPageRoute: () {
                ref.read(sessionStore).logout();
                Logger().d("로그아웃 완료");
                Navigator.popAndPushNamed(context, Move.LoginPage);
              },
              buttonText: "로그아웃",
              textColor: kFontWhite,
              borderRadius: 5,
              backgroundColor: kBackGray,
            ))
      ],
    );
  }
}

class MySettingServiceSettingList extends StatelessWidget {
  const MySettingServiceSettingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTitleGrayForm(title: "서비스 설정"),
      Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            CustomTitleAndForwardForm(
              title: "내 정보 관리",
              textStyle: subTitle2(),
              funPageRoute: () {
                Navigator.pushNamed(context, Move.MySettingProfilePage);
              },
            ),
            CustomTitleAndForwardForm(
              title: "회원 탈퇴",
              textStyle: subTitle2(),
              funPageRoute: () {
                Navigator.pushNamed(context, Move.MySettingResignationPage);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}

class MySettingServiceAboutList extends StatelessWidget {
  const MySettingServiceAboutList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleGrayForm(title: "서비스 안내"),
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleAndForwardForm(
                title: "고객센터",
                textStyle: subTitle2(),
                funPageRoute: () {
                  // TODO 대욱 : 고객센터로 페이지 이동
                  Navigator.pushNamed(context, "/mySettingCustomer");
                },
              ),
              SizedBox(height: gapMain),
              Padding(
                padding: EdgeInsets.only(left: gapMain),
                child: Container(
                  height: 56,
                  child: RichText(
                    text: TextSpan(
                        text: "버전정보",
                        style: subTitle2(mColor: kFontBlack),
                        children: [
                          TextSpan(text: "  "),
                          TextSpan(
                              text: "2.1.0",
                              style: subTitle2(
                                  mColor: kFontGray,
                                  mFontWeight: FontWeight.w500))
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
