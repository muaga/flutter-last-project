import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomUserReviewTitle extends StatelessWidget {
  final int? bookReplyCount;

  const CustomUserReviewTitle({this.bookReplyCount});

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
          "${bookReplyCount ?? ""}",
          // 댓글이 없으면 공백처리
          style: subTitle1(),
        ),
      ],
    );
  }
}
