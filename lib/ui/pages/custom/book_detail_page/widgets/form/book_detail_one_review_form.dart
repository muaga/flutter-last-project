import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_page.dart';
import 'package:flutter_blog/ui/widgets/button/custom_page_forward_button.dart';
import 'package:flutter_blog/ui/widgets/custom_user_review_title.dart';
import 'package:flutter_blog/ui/widgets/form/custom_review_list_form.dart';

class BookDetailOneReviewForm extends StatelessWidget {
  const BookDetailOneReviewForm(
      {required this.book, required this.sessionUser});
  final BookDetailModel book;
  final SessionUser sessionUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: CustomUserReviewTitle(
                      bookReplyCount: book.bookDetailReplyList.length),
                ),
                CustomPageForwardButton(
                    bookId: book.bookId, bookDetailReplyList: book),
              ],
            ),
          ),
        ),
        CustomReviewListForm(
            bookDetailReplyList: book.bookDetailReplyList,
            sessionUser: sessionUser),
      ],
    );
  }
}
