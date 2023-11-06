import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';

class NowRankingBookForm extends StatelessWidget {
  const NowRankingBookForm(
      {super.key,
      required this.id,
      required this.rankingId,
      this.state,
      required this.title,
      required this.writer,
      required this.bookPicUrl});

  final int id;
  final int rankingId;
  final String? state;
  final String title;
  final String writer;
  final String bookPicUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(bookId: id)));
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: gapSmall),
          child: Container(
            width: getScreenWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: kBackWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kFontLightGray, // 그림자의 색상
                  offset: Offset(1, 1), // 그림자의 위치 (x, y)
                  blurRadius: 8.0, // 그림자의 흐림 정도
                  spreadRadius: 2.0, // 그림자의 확산 정도
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(gapMedium),
              child: Row(
                children: [
                  Container(
                    width: getScreenWidth(context) * 0.12,
                    height: getScreenWidth(context) * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(color: kBackLight2Gray),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            "http://172.30.56.249:8080/images/${bookPicUrl}",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: gapMedium),
                  Column(
                    children: [
                      Text("${rankingId}", style: title1()),
                      if (state == "up") iconUp(),
                      if (state == "down") iconDown(),
                      if (state == null) iconUnchanged(),
                    ],
                  ),
                  const SizedBox(width: gapMedium),
                  Container(
                    width: getScreenWidth(context) * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${title}",
                            style: subTitle3(mFontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        Text("${writer}",
                            style: body2(
                                mColor: kFontGray,
                                mFontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
