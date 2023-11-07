import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:logger/logger.dart';

class MyLibraryMainReadingNotePostContent extends StatelessWidget {
  final String postComent;
  final String postDate;
  final Book? book;
  const MyLibraryMainReadingNotePostContent(
      {required this.postComent, required this.postDate, this.book});

  @override
  Widget build(BuildContext context) {
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
                    // 삭제 동작 수행
                    Logger().d("여기는 버튼이야");
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
