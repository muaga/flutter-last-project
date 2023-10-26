import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_plus.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';

class BookDetailIntroduceForm extends StatelessWidget {
  const BookDetailIntroduceForm({
    super.key,
    required this.book,
  });

  final BookDetailModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookDetailPlus(
          title: "책 소개",
          description: "${book.bookIntroduction}",
        ),
      ],
    );
  }
}
