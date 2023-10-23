import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomUserReviewTitle extends StatelessWidget {
  const CustomUserReviewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "한 줄 리뷰",
          style: subTitle1(),
        ),
        SizedBox(width: gapMedium),
        Text(
          "350",
          style: subTitle1(),
        ),
      ],
    );
  }
}
