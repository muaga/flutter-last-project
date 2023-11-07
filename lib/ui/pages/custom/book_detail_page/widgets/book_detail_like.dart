import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';

class BookDetailLike extends StatelessWidget {
  const BookDetailLike({required this.book});

  final BookDetailModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
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
                      "이 책이 담긴 서재",
                      style: body2(mColor: kFontGray),
                    ),
                    SizedBox(height: gapSmall),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '${book.bookLikeCount}', style: subTitle3()),
                      TextSpan(text: '개', style: subTitle3()),
                    ]))
                  ],
                ),
              ),
            ),
            Container(height: gapXlarge, width: 1, color: Colors.grey),
            Expanded(
              child: Container(
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '${book.bookReplyCount}', style: subTitle3()),
                      TextSpan(text: '개', style: subTitle3()),
                    ])),
                  ],
                ),
              ),
            ),
            Container(height: 35, width: 1, color: Colors.grey),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Move.PostWritePage);
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
            ),
          ],
        ),
      ),
    );
  }
}
