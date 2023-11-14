import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryPostContent extends ConsumerWidget {
  final int postId;
  final String postTitle;
  final String postCreatedAt;
  MyLibraryPostContent({
    required this.postId,
    required this.postTitle,
    required this.postCreatedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 화면 너비의 80%
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7, // 화면 너비의 80%
                  child: Text(
                    postTitle,
                    style: subTitle2(mFontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: gapSmall),
                Text(postCreatedAt, style: subTitle3(mColor: kFontGray)),
              ],
            ),
          ),
          Container(
            child: PopupMenuButton<String>(
              iconSize: 20,
              offset: Offset(20, -30), // 아이콘 위치를 조정합니다.
              onSelected: (String choice) async {
                if (choice == "삭제하기") {
                  await ref.read(myLibraryProvider.notifier).deletePost(postId);
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
    );
  }
}
