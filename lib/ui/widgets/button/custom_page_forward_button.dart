import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/custom/book_reply_list_page/book_reply_list_page.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_page.dart';

class CustomPageForwardButton extends StatelessWidget {
  final int bookId;
  final bookDetailReplyList;
  const CustomPageForwardButton(
      {required this.bookId, required this.bookDetailReplyList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReplyWriteAndListPage(bookId: bookId)));
      },
      child: Align(
          alignment: Alignment.centerRight, child: iconArrowForward(mSize: 16)),
    );
  }
}
