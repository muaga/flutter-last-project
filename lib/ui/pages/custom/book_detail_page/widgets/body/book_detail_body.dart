import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_comment.dart';

import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_like.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_data_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_info_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_introduce_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_sub_info_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';

class BookDetailBody extends StatelessWidget {
  final Book book;
  const BookDetailBody({required this.book});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BookDetailInfoForm(book: book),
        BookDetailLike(),
        SizedBox(height: gapMain),
        CustomThickLine(),
        BookDetailComment(),
        CustomThickLine(),
        BookDetailIntroduceForm(book: book),
        BookDetailDataForm(),
        BookDetailSubInfoForm(book: book),
        CustomThickLine(),
        BookDetailOneReviewForm(),
      ],
    );
  }
}
