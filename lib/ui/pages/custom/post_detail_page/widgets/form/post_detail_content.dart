import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class PostDetailContent extends StatelessWidget {
  final String content;

  const PostDetailContent(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(content, style: body1(mFontWeight: FontWeight.normal)),
    );
  }
}
