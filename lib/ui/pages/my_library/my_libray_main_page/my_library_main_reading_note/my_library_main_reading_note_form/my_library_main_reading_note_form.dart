import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_content.dart';

class MyLibraryMainReadingNoteForm extends StatelessWidget {
  final String oneReviewComent;
  final String oneReviewDate;
  final Book book;
  const MyLibraryMainReadingNoteForm(
      {required this.oneReviewComent,
      required this.oneReviewDate,
      required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyLibraryMainReadingNoteContent(
            oneReviewComent: oneReviewComent,
            oneReviewDate: oneReviewDate,
          ),
          SizedBox(height: gapLarge),
          MyLibraryMainReadingNoteBook(book: book),
          SizedBox(height: gapXlarge),
        ],
      ),
    );
  }
}
