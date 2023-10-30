import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/my_library/my_library_main_bookcase.dart';
import 'package:flutter_blog/ui/pages/my_library/my_library_main_like_books.dart';
import 'package:flutter_blog/ui/pages/my_library/my_library_main_reading_note.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_main_app_bar_bottom_sheet_button.dart';

class MtLibraryMainAppbarBottomSheet extends StatelessWidget {
  const MtLibraryMainAppbarBottomSheet({
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
                height: 210, // 바텀 시트의 높이 설정
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
                        MyLibraryMainAppBarBottomSheetButton(
                            buttonText: "좋아하는 책",
                            destination: MyLibraryMainLikeBooks()),
                        MyLibraryMainAppBarBottomSheetButton(
                            buttonText: "책장",
                            destination: MyLibraryMainBookcase()),
                        MyLibraryMainAppBarBottomSheetButton(
                            buttonText: "독서노트",
                            destination: MyLibraryMainReadingNote()),
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
