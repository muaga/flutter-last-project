import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MyLibraryMainAppBarBottomSheetButton extends StatelessWidget {
  final String buttonText; // 다른 텍스트를 받을 변수
  final Widget destination; // 다른 페이지로 이동할 위젯을 받을 변수

  MyLibraryMainAppBarBottomSheetButton({
    required this.buttonText,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(buttonText); // 다른 텍스트 출력
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination, // 다른 페이지로 이동
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              iconBottomFeed(),
              SizedBox(width: gapMedium),
              Text(
                buttonText, // 받은 텍스트 사용
                style: subTitle2(mFontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
