import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class PostDetailTitle extends StatelessWidget {
  final String boardTitle;

  const PostDetailTitle(this.boardTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      boardTitle,
      style: title1(),
    );
  }
}
