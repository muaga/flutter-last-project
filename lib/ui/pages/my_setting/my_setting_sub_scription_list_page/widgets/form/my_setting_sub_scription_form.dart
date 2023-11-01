import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/my_setting_sub_scription_pay_check_icon.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

import '../../../../../../_core/constants/color.dart';

class MySettingSubSciptionForm extends StatelessWidget {
  const MySettingSubSciptionForm(
      {super.key,
      required this.startDuration,
      required this.endDuration,
      required this.paymentDate,
      required this.price,
      this.subScriptionNumber,
      this.payment});

  final String startDuration;
  final String endDuration;
  final String paymentDate;
  final String? subScriptionNumber;
  final String price;
  final String? payment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kFontLightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("월 정기 구독", style: subTitle2(mFontWeight: FontWeight.w600)),
            const SizedBox(height: gapSmall),
            Text("${startDuration} ~ ${endDuration}",
                style: body1(mColor: kFontGray)),
            Text("결제일 : ${paymentDate}", style: body1(mColor: kFontGray)),
            Text("정기구독 이용권 : ${subScriptionNumber ?? ""}",
                style: body1(mColor: kFontGray)),
            const SizedBox(height: gapMain),
            CustomThinLine(),
            const SizedBox(height: gapMain),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("상품금액",
                    style: subTitle3(
                        mColor: kFontGray, mFontWeight: FontWeight.w500)),
                if (price != null) Text("${price}원", style: subTitle3()),
                if (price == null)
                  Text("-${price}원", style: subTitle3(mColor: kFontGray)),
              ],
            ),
            const SizedBox(height: gapMain),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("결제금액",
                    style: subTitle3(
                        mColor: kFontGray, mFontWeight: FontWeight.w500)),
                Text(payment ?? "원", style: subTitle2(mColor: kPointColor)),
              ],
            ),
            const SizedBox(height: gapMain),
            CustomThinLine(),
            const SizedBox(height: gapMain),
            MySettingSubScriptionPayCheckIcon()
          ],
        ),
      ),
    );
  }
}
