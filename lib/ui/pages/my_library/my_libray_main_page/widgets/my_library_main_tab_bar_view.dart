import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_library_choice_page/my_library_main_bookcase.dart';
import 'package:flutter_blog/ui/pages/my_library/my_library_choice_page/my_library_main_like_books.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_book_reply_form.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_reading_note/my_library_main_reading_note_form/my_library_post_form.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainTabBarView extends StatefulWidget {
  final User user;

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
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      MyLibraryModel? model = ref.watch(myLibraryProvider);

      List<BookReplyDTO> bookReplyList =
          model!.postList.replyList.bookReplyList;
      List<BoardDTO> postList = model!.postList.boardList;

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
                    MyLibraryModel? model = ref.watch(myLibraryProvider);
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
              Expanded(
                  child: CustomBookGridView(likeListDTO: model!.likeBookList)),
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
              Expanded(
                  child: CustomBookGridView(
                readingBookDTO: model!.readingBookList,
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    children: [
                      CustomCategoryButton(
                          label: "한 줄 리뷰",
                          index: 0,
                          pageIndex: _pageIndex,
                          fontWeight: FontWeight.bold,
                          onPress: () {
                            changePage(0);
                          }),
                      CustomCategoryButton(
                          label: "포스트",
                          index: 1,
                          pageIndex: _pageIndex,
                          fontWeight: FontWeight.bold,
                          onPress: () {
                            changePage(1);
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: IndexedStack(
                          index: _pageIndex,
                          children: [
                            /// 한 줄 리뷰
                            ListView.builder(
                              itemCount: model!.postList.replyList.bookReplyList
                                      .length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    MyLibraryBookReplyForm(
                                      replyId: bookReplyList[index].bookReplyId,
                                      replyComment:
                                          bookReplyList[index].bookReplyContent,
                                      replyCreatedAt: bookReplyList[index]
                                          .bookReplyCreatedAt,
                                      bookWriter:
                                          bookReplyList[index].bookWriter,
                                      bookTitle: bookReplyList[index].bookTitle,
                                      bookPicUrl:
                                          bookReplyList[index].bookPicUrl,
                                    ),
                                  ],
                                );
                              },
                            ),

                            /// 포스트
                            ListView.builder(
                              itemCount: postList.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostDetailPage(
                                          boardId: postList[index].boardId!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      MyLibraryPostForm(
                                        postId: postList[index].boardId!,
                                        postTitle: postList[index].boardTitle,
                                        postCreatedAt:
                                            postList[index].boardCreatedAt,
                                      ),
                                    ],
                                  ),
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
    });
  }
}
