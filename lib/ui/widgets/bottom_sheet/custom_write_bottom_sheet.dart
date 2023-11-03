import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/post_write_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_one_review.dart';
import 'package:flutter_blog/ui/widgets/bottom_sheet/custom_write_bottom_sheet_button.dart';

class CustomWriteBottomSheet extends StatelessWidget {
  const CustomWriteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent, // 배경을 투명하게 설정
            builder: (BuildContext context) {
              return Container(
                height: 150, // 바텀 시트의 높이 설정
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomWriteBottomSheetButton(
                            buttonText: "포스트 쓰기", destination: PostWritePage()),
                        CustomWriteBottomSheetButton(
                            buttonText: "한 줄 리뷰쓰기",
                            destination: MyLibraryOneReview()),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        icon: iconPost());
  }
}
