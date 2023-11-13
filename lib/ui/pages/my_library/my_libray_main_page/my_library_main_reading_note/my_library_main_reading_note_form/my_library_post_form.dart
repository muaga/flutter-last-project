import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_post_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryPostForm extends ConsumerWidget {
  final int postId;
  final String postTitle;
  final String postCreatedAt;

  const MyLibraryPostForm({
    required this.postId,
    required this.postTitle,
    required this.postCreatedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: gapMedium),
      child: Container(
        child: Column(
          children: [
            MyLibraryPostContent(
              postId: postId,
              postTitle: postTitle,
              postCreatedAt: postCreatedAt,
            ),
            SizedBox(height: gapMedium),
          ],
        ),
      ),
    );
  }
}
