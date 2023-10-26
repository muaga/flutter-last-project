import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';

class BookDetailComment extends StatelessWidget {
  const BookDetailComment({required this.book});

  final BookDetailModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              /// TODO 대욱 : 머릿말
              book.bookSubTitle,
              style: subTitle2(),
            ),
          ],
        ),
      ),
    );
  }
}
