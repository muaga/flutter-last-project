import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_choice_page/my_setting_resignation_choice_page.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';

class MySettingResignationTwoButton extends StatelessWidget {
  const MySettingResignationTwoButton({super.key, required this.funPageRoute});

  final funPageRoute;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomRadiusColorButton(
            buttonText: "나중에 하기",
            funPageRoute: () {
              Navigator.pop(context);
            },
            backgroundColor: kBackGray,
            borderRadius: 10,
          ),
        ),
        SizedBox(width: gapMedium),
        Expanded(
          child: CustomRadiusColorButton(
            buttonText: "계속 진행하기",
            funPageRoute: funPageRoute,
            backgroundColor: kPrimaryColor,
            borderRadius: 10,
          ),
        ),
      ],
    );
  }
}
