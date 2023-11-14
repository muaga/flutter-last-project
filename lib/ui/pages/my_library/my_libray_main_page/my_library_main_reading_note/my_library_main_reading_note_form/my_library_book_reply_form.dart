import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_book_reply_content.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryBookReplyForm extends ConsumerWidget {
  final int replyId;
  final String replyComment;
  final String replyCreatedAt;
  final String? bookPicUrl;
  final String? bookWriter;
  final String? bookTitle;
  const MyLibraryBookReplyForm(
      {required this.replyId,
      required this.replyComment,
      required this.replyCreatedAt,
      this.bookPicUrl,
      this.bookTitle,
      this.bookWriter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: gapMedium),
      child: Container(
        child: Column(
          children: [
            MyLibraryBookReplyContent(
                replyId: replyId,
                replyComment: replyComment,
                replyCreatedAt: replyCreatedAt),
            SizedBox(height: gapMedium),
            MyLibraryMainReadingNotePostBook(
                picUrl: bookPicUrl!, writer: bookWriter!, title: bookTitle!),
            SizedBox(height: gapMedium),
          ],
        ),
      ),
    );
  }
}
