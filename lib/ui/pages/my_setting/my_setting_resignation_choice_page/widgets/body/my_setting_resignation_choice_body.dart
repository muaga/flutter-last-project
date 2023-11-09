import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_choice_page/widgets/my_setting_resignation_choice_radio_button.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_two_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class MySettingResignationChoiceBody extends ConsumerWidget {
  const MySettingResignationChoiceBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("서재 이용 현황", style: subTitle2()),
          SizedBox(height: gapMedium),
          Expanded(
            child: MySettingResignationChoiceRadioButton(),
          ),
          SizedBox(height: gapXlarge),
          MySettingResignationTwoButton(
            yellowButtonText: "탈퇴하기",
            funPageRoute: () {
              Logger().d("탈퇴하기 눌러짐");
              ref.read(sessionStore).resignation();
            },
          ),
        ],
      ),
    );
  }
}
