import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class NowTitleAndForwardForm extends StatelessWidget {
  const NowTitleAndForwardForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child: Container(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "지금! 서점 베스트",
                  style: subTitle2(
                      mColor: kFontBlack, mFontWeight: FontWeight.bold),
                ),
                Text("서점 3사 100위 내, 72권을 밀리에서 만나보세요",
                    style: body3(mColor: kFontGray))
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Move.BookStoreBestBookListPage);
              },
              icon: iconArrowForward(),
            ),
          ],
        ),
      ),
    );
  }
}
