import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class MySettingResignationState extends StatelessWidget {
  const MySettingResignationState(
      {super.key,
      required this.title,
      required this.quantity,
      required this.unit});

  final String title;
  final int quantity;
  final String unit; // 권, 개, 밀, 마일리지 등 단위

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${title}",
          style: body1(mColor: kFontGray, mFontWeight: FontWeight.normal),
        ),
        Text(
          "${quantity}${unit}",
          style: body1(),
        )
      ],
    );
  }
}
