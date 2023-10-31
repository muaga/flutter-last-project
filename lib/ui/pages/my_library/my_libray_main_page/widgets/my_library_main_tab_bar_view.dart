import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';

class MyLibraryMainTabBarView extends StatelessWidget {
  final User user;
  MyLibraryMainTabBarView({required this.user});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                onSelected: (String choice) {
                  if (choice == "delete") {
                    // 삭제 작업을 수행하거나 삭제 다이얼로그를 표시할 수 있습니다.
                    // 예를 들어 showDialog()를 사용하여 삭제 확인 대화상자를 표시할 수 있습니다.
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
            Expanded(child: CustomBookGridView()),
          ],
        ),
        Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                onSelected: (String choice) {
                  if (choice == "delete") {
                    // 삭제 작업을 수행하거나 삭제 다이얼로그를 표시할 수 있습니다.
                    // 예를 들어 showDialog()를 사용하여 삭제 확인 대화상자를 표시할 수 있습니다.
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
            Expanded(child: CustomBookGridView()),
          ],
        ),
        Column(
          children: [
            Expanded(child: MyLibraryMainReadingNote()),
          ],
        ),
      ],
    );
  }
}
