import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class BookDetailPlus extends StatefulWidget {
  final String title;
  final String description;
  BookDetailPlus({required this.title, required this.description});
  @override
  State<BookDetailPlus> createState() => _BookDetailPlus();
}

class _BookDetailPlus extends State<BookDetailPlus> {
  bool isExpanded = false;

  void toggleDescription() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: subTitle1(),
                ),
                SizedBox(height: gapLarge),
                Text(
                  isExpanded ? widget.description : _getShortenedDescription(),
                  softWrap: true,
                  style: body1(mFontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                toggleDescription();
              },
              child: Text(
                isExpanded ? "접어보기" : "더 보기",
                style: TextStyle(
                  color: kPointColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getShortenedDescription() {
    final maxLength = 30; // 원하는 길이로 수정하세요
    if (widget.description.length <= maxLength) {
      return widget.description;
    }
    return widget.description.substring(0, maxLength) + '...';
  }
}
