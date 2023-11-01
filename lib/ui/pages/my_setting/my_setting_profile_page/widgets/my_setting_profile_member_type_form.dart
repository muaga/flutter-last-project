import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MySettingProfileMemberTypeForm extends StatelessWidget {
  const MySettingProfileMemberTypeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kStartColor, kEndColor],
            ),
          ),
          child: iconPhone(mSize: 20, mColor: kFontWhite),
        ),
        SizedBox(width: gapMedium),
        Text("휴대폰 계정 회원", style: subTitle3().copyWith(color: kFontGray))
      ],
    );
  }
}
