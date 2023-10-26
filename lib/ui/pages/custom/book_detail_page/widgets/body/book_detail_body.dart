import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_comment.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_like.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_data_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_info_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_introduce_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/form/book_detail_sub_info_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookDetailBody extends ConsumerWidget {
  final int bookId;
  const BookDetailBody({required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetailModel = ref.watch(bookDetailProvider(1));
    // Logger().d(bookDetailModel);
    BookDetailModel book;
    Logger().d(bookDetailModel);

    if (bookDetailModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      Logger().d(bookDetailModel);

      book = bookDetailModel; // book 변수를 초기화
    }
    Logger().d("ListView 진입");
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
        BookDetailOneReviewForm(book: book),
      ],
    );
  }
}
