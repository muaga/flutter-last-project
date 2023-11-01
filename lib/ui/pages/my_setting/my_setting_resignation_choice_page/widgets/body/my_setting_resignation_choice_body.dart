import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_choice_page/widgets/my_setting_resignation_choice_radio_button.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_two_button.dart';

class MySettingResignationChoiceBody extends StatelessWidget {
  const MySettingResignationChoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/loginJoin', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
