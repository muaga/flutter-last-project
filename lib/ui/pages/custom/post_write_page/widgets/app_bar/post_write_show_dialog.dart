import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class PostWriteShowDialog extends StatelessWidget {
  const PostWriteShowDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: kBackGray, minimumSize: Size(130, 50)),
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
                  backgroundColor: kPrimaryColor, minimumSize: Size(130, 50)),
              onPressed: () {
                Navigator.pop(context);
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
  }
}
