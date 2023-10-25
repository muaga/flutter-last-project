import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class PostDetailTitle extends StatelessWidget {
  const PostDetailTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "[밀리의 발견]말 많은 소녀, 오늘 밤엔 내 침대에서 잘 수 있어!",
      style: title1(),
    );
  }
}
