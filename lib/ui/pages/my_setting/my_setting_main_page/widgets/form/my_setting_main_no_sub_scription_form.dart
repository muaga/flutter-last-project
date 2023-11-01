import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/form/custom_sub_scription_form.dart';

class MySettingMainNoSubScriptionForm extends StatelessWidget {
  const MySettingMainNoSubScriptionForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kFontLightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: gapMain, left: gapMain, right: gapMain, bottom: gapLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSubScriptionForm(title: "정기구독을 시작하세요.", buttonText: "구독관리"),
            const SizedBox(height: gapSmall),
            Text("어려운 독서, 시작하면 습관이 됩니다.", style: body1(mColor: kFontGray)),
          ],
        ),
      ),
    );
  }
}
