import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MySettingSubScriptionPayCheckIcon extends StatelessWidget {
  const MySettingSubScriptionPayCheckIcon(
      {super.key, required this.subScriptionState});

  final bool subScriptionState;
  // TODO 은혜 : 결제 완료이면 true, 환불 완료이면 false

  @override
  Widget build(BuildContext context) {
    if (subScriptionState == true) {
      return Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kPointColor),
            child: iconPriceCheck(mSize: 20, mColor: kFontWhite),
          ),
          SizedBox(width: gapMedium),
          Text("결제 완료", style: subTitle3(mColor: kPointColor))
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(shape: BoxShape.circle, color: kFontGray),
            child: iconRefund(mSize: 20, mColor: kFontWhite),
          ),
          SizedBox(width: gapMedium),
          Text("환불 완료", style: subTitle3(mColor: kFontGray))
        ],
      );
    }
  }
}
