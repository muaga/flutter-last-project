import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class MyLibraryMainLikeBooks extends StatefulWidget {
  const MyLibraryMainLikeBooks({super.key});

  @override
  State<MyLibraryMainLikeBooks> createState() => _MyLibraryMainLikeBooksState();
}

class _MyLibraryMainLikeBooksState extends State<MyLibraryMainLikeBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("좋아하는 책"),
      ),
      body: Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 2,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                int? bookId = books[index].id;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          '알림',
                          style: subTitle1(mFontWeight: FontWeight.bold),
                        ),
                      ),
                      content: Text(
                        "북마크를 해제할까요?",
                        style: body1(mColor: kFontGray),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: kBackGray, // 배경색
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                Navigator.of(context).pop(); // 알림창 닫기
                              },
                              child: Text(
                                '취소',
                                style: subTitle3(mColor: kFontBlack),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: kPrimaryColor, // 배경색
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                // 삭제 동작을 수행하거나 필요한 작업을 추가
                                Navigator.of(context).pop(); // 알림창 닫기
                              },
                              child: Text(
                                '해제',
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
              child: CustomGridBookCard(books[index]),
            );
          },
          // 더 많은 리스트 아이템을 추가할 수 있습니다.
        ),
      ),
    );
  }
}
