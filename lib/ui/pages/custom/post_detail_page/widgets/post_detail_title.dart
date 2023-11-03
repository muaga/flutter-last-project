import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class PostDetailTitle extends StatelessWidget {
  final String title;

  const PostDetailTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: title1(),
    );
  }
}
