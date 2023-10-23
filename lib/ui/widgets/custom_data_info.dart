import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomDataInfo extends StatelessWidget {
  final String dataTitle;
  final String dataContent;

  CustomDataInfo({
    required this.dataTitle,
    required this.dataContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(dataTitle, style: body2(mColor: kFontGray)),
        SizedBox(height: gapMain),
        Text(
          dataContent,
          style: subTitle3(),
        ),
      ],
    );
  }
}
