import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MyLibraryMainReadingNoteContent extends StatelessWidget {
  final String oneReviewComent;
  final String oneReviewDate;
  const MyLibraryMainReadingNoteContent(
      {required this.oneReviewComent, required this.oneReviewDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(oneReviewComent,
                    style: subTitle1(mFontWeight: FontWeight.bold)),
                SizedBox(height: gapSmall),
                Text(oneReviewDate, style: subTitle2(mColor: kFontGray)),
              ],
            ),
          ),
          Container(
            child: PopupMenuButton<String>(
              onSelected: (String choice) {
                if (choice == "delete") {
                  // 작업을 수행하거나 다이얼로그를 표시할 수 있습니다.
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
        ],
      ),
    );
  }
}
