import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainReadingNotePostContent extends ConsumerWidget {
  final String postComent;
  final String postDate;
  final Book? book;
  final int? boardId;
  MyLibraryMainReadingNotePostContent(
      {required this.postComent,
      required this.postDate,
      this.book,
      this.boardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionStore);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postComent,
                      style: subTitle2(mFontWeight: FontWeight.bold)),
                  SizedBox(height: gapSmall),
                  Text(postDate, style: subTitle3(mColor: kFontGray)),
                ],
              ),
            ),
            Container(
              child: PopupMenuButton<String>(
                iconSize: 20,
                offset: Offset(20, -30), // 아이콘 위치를 조정합니다.
                onSelected: (String choice) {
                  if (choice == "삭제하기") {
                    ref
                        .read(MyLibraryProvider(sessionUser.user!.id).notifier)
                        .deletePost(boardId!);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return ["삭제하기"].map((String choice) {
                    return PopupMenuItem<String>(
                      padding: EdgeInsets.only(left: 25),
                      height: 20,
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
