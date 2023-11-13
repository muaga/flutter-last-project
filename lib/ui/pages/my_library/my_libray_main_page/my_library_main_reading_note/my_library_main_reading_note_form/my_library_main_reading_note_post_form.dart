import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/view_model/post_detail_page_view_model.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_post_content.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainReadingNotePostForm extends ConsumerWidget {
  final String postComent;
  final String postDate;
  final int? bookId;
  final int? boardId;
  const MyLibraryMainReadingNotePostForm(
      {required this.postComent,
      required this.postDate,
      this.bookId,
      this.boardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailModel? model = ref.read(postDetailProvider(boardId!));
    // int? bookId = model?.bookId;
    // String? bookTitle = model?.bookTitle;
    // String? bookWriter = model?.
    return Container(
      child: Column(
        children: [
          MyLibraryMainReadingNotePostContent(
              postComent: postComent, postDate: postDate, boardId: boardId),
          SizedBox(height: gapLarge),
          // if(bookId)
          MyLibraryMainReadingNotePostBook(bookId: bookId),
          SizedBox(height: gapXlarge),
          CustomThinLine(),
          SizedBox(height: gapLarge),
        ],
      ),
    );
  }
}
