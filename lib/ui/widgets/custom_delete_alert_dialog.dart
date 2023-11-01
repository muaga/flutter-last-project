import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomDeleteAlertDialog extends StatelessWidget {
  const CustomDeleteAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.buttonText});

  final String title;
  final String content;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "책 삭제",
        style: title1(),
        textAlign: TextAlign.center,
      ),
      content: Text(
        "선택한 책 삭제 하시겠습니까?",
        style: body1(mColor: kFontGray),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                color: kFontBlack,
              ),
              Expanded(
                child: Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: kFontRed, // 빨간색 테두리
                      ),
                    ),
                    child: Text("삭제"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
