import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_book_image.dart';
import 'package:flutter_blog/ui/widgets/custom_book_title_and_writer.dart';

class BookDetailInfoForm extends StatelessWidget {
  const BookDetailInfoForm({
    super.key,
    required this.book,
  });

  final BookDetailModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookImage(picUrl: book.bookPicUrl ?? ""),
        SizedBox(height: gapLarge),
        CustomBookTitleAndWriter(
            title: book.bookTitle ?? "", writer: book.bookWriter ?? ""),
      ],
    );
  }
}
