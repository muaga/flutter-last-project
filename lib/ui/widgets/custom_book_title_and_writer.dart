import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomBookTitleAndWriter extends StatelessWidget {
  final String title;
  final String writer;

  const CustomBookTitleAndWriter({required this.title, required this.writer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: title1(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: gapMedium),
          Text(
            writer,
            style: subTitle2(mColor: kFontGray),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
