import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/widgets/button/custom_page_forward_button.dart';
import 'package:flutter_blog/ui/widgets/custom_user_review_title.dart';
import 'package:flutter_blog/ui/widgets/form/custom_review_list_form.dart';

class BookDetailOneReviewForm extends StatelessWidget {
  const BookDetailOneReviewForm({
    super.key,
  });

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
                  child: CustomUserReviewTitle(),
                ),

                /// TODO 대욱 : 페이지 경로 넣기
                CustomPageForwardButton(pageLoad: BookDetailPage(bookId: 1)),
              ],
            ),
          ),
        ),
        CustomReviewListForm(),
      ],
    );
  }
}
