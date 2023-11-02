import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';

class MySettingResignationTwoButton extends StatelessWidget {
  const MySettingResignationTwoButton(
      {super.key, required this.funPageRoute, required this.yellowButtonText});

  final String yellowButtonText;
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
            borderRadius: 5,
          ),
        ),
        SizedBox(width: gapMedium),
        Expanded(
          child: CustomRadiusColorButton(
            buttonText: yellowButtonText,
            funPageRoute: funPageRoute,
            backgroundColor: kPrimaryColor,
            borderRadius: 5,
          ),
        ),
      ],
    );
  }
}
