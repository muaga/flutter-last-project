import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_reply_list/book_reply_list_page.dart';
import 'package:flutter_blog/ui/widgets/button/custom_page_forward_button.dart';
import 'package:flutter_blog/ui/widgets/custom_user_review_title.dart';
import 'package:flutter_blog/ui/widgets/form/custom_review_list_form.dart';

class BookDetailOneReviewForm extends StatelessWidget {
  const BookDetailOneReviewForm({required this.book});
  final BookDetailModel book;

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
                  pageLoad: BookReplyListPage(
                    bookId: book.bookId,
                    bookDetailReplyList: [],
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomReviewListForm(bookDetailReplyList: book.bookDetailReplyList),
      ],
    );
  }
}
