import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_reply_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MyLibraryMainReadingNotePostForm extends StatelessWidget {
  final String oneReviewComent;
  final String oneReviewDate;
  final Book book;
  const MyLibraryMainReadingNotePostForm(
      {required this.oneReviewComent,
      required this.oneReviewDate,
      required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // TODO 대욱 : 포스트 내용이 존재할 때, MyLibraryMainReadingNoteReplyForm() 커스텀으로 변경 후 사용 => 댓글도 수정
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
