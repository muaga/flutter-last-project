import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/widgets/custom_book_image.dart';
import 'package:flutter_blog/ui/widgets/custom_book_title_and_writer.dart';

class BookDetailInfoForm extends StatelessWidget {
  const BookDetailInfoForm({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookImage(picUrl: book.picUrl ?? ""),
        SizedBox(height: gapLarge),
        CustomBookTitleAndWriter(
            title: book.title ?? "", writer: book.writer ?? ""),
      ],
    );
  }
}
