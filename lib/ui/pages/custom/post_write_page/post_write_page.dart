import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_book_recommend_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/body/post_write_body.dart';
import 'package:logger/logger.dart';

class PostWritePage extends StatefulWidget {
  Book? selectedBook;

  PostWritePage({this.selectedBook, Key? key}) : super(key: key);

  @override
  _PostWritePageState createState() => _PostWritePageState();
}

class _PostWritePageState extends State<PostWritePage> {
  // Book? selectedBook; // 변수를 추가하여 선택한 책을 추적

  @override
  Widget build(BuildContext context) {
    Logger().d("도착?${widget.selectedBook}");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(
                    child: Text(
                      '포스트 작성중',
                      style: subTitle1(mFontWeight: FontWeight.bold),
                    ),
                  ),
                  content: Text(
                    "작성 중인 포스트가 지워 집니다.\n"
                    "그래도 이동하시겠습니까?",
                    style: body1(mColor: kFontGray),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: kBackGray,
                              minimumSize: Size(130, 50)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '취소',
                            style: subTitle3(mColor: kFontBlack),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              minimumSize: Size(130, 50)),
                          onPressed: () {
                            Navigator.pop(context); // alter 창 종료
                            Navigator.pop(context); // 바텀시트 창 종료
                            Navigator.pop(context);
                          },
                          child: Text(
                            '확인',
                            style: subTitle3(mColor: kFontBlack),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          icon: iconArrowBack(),
        ),
        title: Text("일반 포스트", style: subTitle1()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/post/list");
            },
            child: Text(
              "발행",
              style: subTitle1(mColor: kPointColor),
            ),
          ),
        ],
      ),
      body: PostWriteBody(selectedBook: widget.selectedBook),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: BottomAppBar(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "좋아하는 책을 추천해주세요",
                          style: body1(),
                        ),
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              widget.selectedBook = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PostWriteBookRecommendPage(
                                          selectedBook: null), // 선택한 책 정보를 초기화
                                ),
                              );

                              if (widget.selectedBook != null) {
                                // 선택한 책을 사용하여 원하는 작업을 수행
                                // selectedBook를 사용하여 처리
                              }
                            },
                            child: Text(
                              "책 추천하기",
                              style: subTitle1(mColor: kFontWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
