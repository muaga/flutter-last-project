import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/form/custom_sub_scription_form.dart';

class MySettingMainYesSubScriptionForm extends StatelessWidget {
  const MySettingMainYesSubScriptionForm(
      {super.key,
      required this.startDuration,
      required this.endDuration,
      required this.paymentDate});

  final String startDuration;
  final String endDuration;
  final String paymentDate;

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
            Row(
              children: [
                Text("구독기간", style: body1(mColor: kFontGray)),
                const SizedBox(width: 37),
                Container(
                  height: 12,
                  width: 1.5,
                  color: kFontGray,
                ),
                const SizedBox(width: gapMain),
                Text("${startDuration} ~ ${endDuration}",
                    style: body1(mColor: kFontGray)),
              ],
            ),
            Row(
              children: [
                Text("다음 결제일", style: body1(mColor: kFontGray)),
                const SizedBox(width: gapLarge),
                Container(
                  height: 12,
                  width: 1.5,
                  color: kFontGray,
                ),
                const SizedBox(width: gapMain),
                Text("${paymentDate}", style: body1(mColor: kFontGray)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
