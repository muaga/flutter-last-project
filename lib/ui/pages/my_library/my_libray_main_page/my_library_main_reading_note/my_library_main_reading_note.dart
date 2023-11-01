import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_form.dart';
import 'package:flutter_blog/ui/widgets/custom_tab_bar_menu.dart';

class MyLibraryMainReadingNote extends StatefulWidget {
  List<Board> boards = [
    Board(
      id: 1,
      title: "벤자민 하디의 퓨처셀프",
      content:
          "그동안 주춤했던 뇌를 깨우고 싶거나, 나를 성장시키고 싶으신 분들, 또는 자기 계발의 실질적 행동 지침이 필요하신 분들!! 이 책을 추천드립니다",
      createdAt: "2023-10-10",
      picUrl: "book7.png",
      userId: 1,
      bookId: 2,
    ),
  ];

  @override
  State<MyLibraryMainReadingNote> createState() =>
      _MyLibraryMainReadingNoteState();
}

class _MyLibraryMainReadingNoteState extends State<MyLibraryMainReadingNote> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 수
      child: Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
              tabs: [
                CustomTabBarMenu(tabBarText: "한줄리뷰"),
                CustomTabBarMenu(tabBarText: "포스트"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: TabBarView(
              children: [
                // 첫 번째 탭의 내용
                // CustomTabBarMenu 탭에 대한 내용을 여기에 추가
                ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (BuildContext context, int index) {
                    final book = books[index];

                    return Column(
                      children: [
                        MyLibraryMainReadingNoteForm(
                          book: book,
                          oneReviewComent: "${bookReplys[index].content}",
                          oneReviewDate: "${bookReplys[index].createdAt}",
                        ),
                      ],
                    );
                  },
                ),

                // 두 번째 탭의 내용
                // CustomTabBarMenu 탭에 대한 내용을 여기에 추가
                ListView(children: [Text("포스트 탭 내용")]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
