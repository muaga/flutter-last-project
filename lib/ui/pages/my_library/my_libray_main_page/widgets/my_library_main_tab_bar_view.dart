import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_main_reading_note_form.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_bookcase.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_like_books.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';

class MyLibraryMainTabBarView extends StatefulWidget {
  final User user;
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
  MyLibraryMainTabBarView({required this.user});

  @override
  State<MyLibraryMainTabBarView> createState() =>
      _MyLibraryMainTabBarViewState();
}

class _MyLibraryMainTabBarViewState extends State<MyLibraryMainTabBarView> {
  int _pageIndex = 0;

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

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
                  if (choice == "수정하기") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // 이동할 페이지의 위젯을 반환합니다.
                          return MyLibraryMainLikeBooks();
                        },
                      ),
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return ["수정하기"].map((String choice) {
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
                  if (choice == "수정하기") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // 이동할 페이지의 위젯을 반환합니다.
                          return MyLibraryMainBookcase();
                        },
                      ),
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return ["수정하기"].map((String choice) {
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
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 80,
                        child: Row(
                          children: [
                            CustomCategoryButton(
                                label: "한 줄 리뷰",
                                index: 0,
                                pageIndex: _pageIndex,
                                onPress: () {
                                  changePage(0);
                                }),
                            CustomCategoryButton(
                                label: "포스트",
                                index: 1,
                                pageIndex: _pageIndex,
                                onPress: () {
                                  changePage(1);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: IndexedStack(
                        index: _pageIndex,
                        children: [
                          /// 한줄리뷰
                          ListView.builder(
                            itemCount: bookReplys.length,
                            itemBuilder: (BuildContext context, int index) {
                              final book = books[index];

                              return Column(
                                children: [
                                  MyLibraryMainReadingNoteForm(
                                    book: book,
                                    oneReviewComent:
                                        "${bookReplys[index].content}",
                                    oneReviewDate:
                                        "${bookReplys[index].createdAt}",
                                  ),
                                ],
                              );
                            },
                          ),

                          /// 포스트
                          ListView.builder(
                            itemCount: bookReplys.length,
                            itemBuilder: (BuildContext context, int index) {
                              final book = books[index];

                              return Column(
                                children: [
                                  MyLibraryMainReadingNoteForm(
                                    book: book,
                                    oneReviewComent:
                                        "${bookReplys[index].content}",
                                    oneReviewDate:
                                        "${bookReplys[index].createdAt}",
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
