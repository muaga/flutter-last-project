import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_post_content.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MyLibraryMainReadingNotePostForm extends StatelessWidget {
  final String postComent;
  final String postDate;
  final Book book;
  const MyLibraryMainReadingNotePostForm(
      {required this.postComent, required this.postDate, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyLibraryMainReadingNotePostContent(
              postComent: postComent, postDate: postDate),
          SizedBox(height: gapLarge),
          MyLibraryMainReadingNotePostBook(book: book),
          SizedBox(height: gapXlarge),
          CustomThinLine(),
          SizedBox(height: gapLarge),
        ],
      ),
    );
  }
}
