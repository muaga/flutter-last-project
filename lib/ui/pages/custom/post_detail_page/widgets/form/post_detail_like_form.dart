import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_like_count.dart';

class PostDetailLikeForm extends StatelessWidget {
  const PostDetailLikeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLikeCount(),
        SizedBox(height: gapMedium),
        InkWell(
          onTap: () {},
          child: Text(
            "이 포스트를 좋아하는 사람들",
            style: body1(mColor: kFontGray),
          ),
        ),
        SizedBox(height: gapXlarge),
      ],
    );
  }
}
