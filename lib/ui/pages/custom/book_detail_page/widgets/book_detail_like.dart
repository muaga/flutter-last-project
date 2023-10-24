import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class BookDetailLike extends StatelessWidget {
  const BookDetailLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // (아이콘 + 설명 + 숫자) 조합
            Container(
              width: 100,
              child: Column(
                children: [
                  SizedBox(
                    height: gapXlarge,
                    width: gapXlarge,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/user_images/avatar.png"),
                    ),
                  ),
                  SizedBox(height: gapSmall),
                  Text(
                    /// TODO 대욱 : 책 좋아요! 한 유저수
                    "이 책이 담긴 서재",
                    style: body2(mColor: kFontGray),
                  ),
                  SizedBox(height: gapSmall),
                  Text(
                    "2,380개",
                    style: subTitle3(),
                  ),
                ],
              ),
            ),
            Container(height: gapXlarge, width: 1, color: Colors.grey),
            Container(
              width: 100,
              child: Column(
                children: [
                  iconReply(mColor: kFontGray),
                  SizedBox(height: gapSmall),
                  Text(
                    "한 줄 리뷰",
                    style: body2(mColor: kFontGray),
                  ),
                  SizedBox(height: gapSmall),
                  Text(
                    /// TODO 대욱 : 리뷰개수
                    "4개",
                    style: subTitle3(),
                  ),
                ],
              ),
            ),
            Container(height: 35, width: 1, color: Colors.grey),
            TextButton(
              onPressed: () {
                /// TODO 대욱 : 포스트 작성 페이지 이동
              },
              child: Container(
                width: 100,
                child: Column(
                  children: [
                    iconPost(mColor: kFontGray),
                    SizedBox(height: gapSmall),
                    Text(
                      "포스트\n"
                      "작성하기",
                      style: body2(mColor: kFontGray),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: gapSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
