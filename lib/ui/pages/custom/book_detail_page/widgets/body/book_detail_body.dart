import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_comment.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_like.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_data_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_info_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_introduce_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_sub_info_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';

class BookDetailBody extends StatelessWidget {
  final BookDetailModel book;
  final SessionUser sessionUser;
  const BookDetailBody({required this.book, required this.sessionUser});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BookDetailInfoForm(book: book),
        BookDetailLike(book: book),
        SizedBox(height: gapMain),
        CustomThickLine(),
        BookDetailComment(book: book),
        CustomThickLine(),
        BookDetailIntroduceForm(book: book),
        BookDetailDataForm(book: book), // "book" 변수를 전달
        BookDetailSubInfoForm(book: book),
        CustomThickLine(),
        BookDetailOneReviewForm(book: book, sessionUser: sessionUser),
      ],
    );
  }
}
