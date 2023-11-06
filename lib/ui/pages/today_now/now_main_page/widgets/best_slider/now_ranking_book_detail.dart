import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';

class NowRankingBookDetail extends StatelessWidget {
  const NowRankingBookDetail(
      {super.key,
      required this.id,
      required this.rankingId,
      this.state,
      required this.title,
      required this.writer,
      required this.bookPicUrl,
      this.titleIntro,
      this.intro});

  final int id;
  final int rankingId;
  final String? state;
  final String title;
  final String writer;
  final String bookPicUrl;
  final String? titleIntro;
  final String? intro;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(bookId: id)));
      },
      child: Column(
        children: [
          /// 순위 바
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  children: [
                    Text("${title}",
                        style: subTitle3(mFontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                    Text("${writer}",
                        style: body2(
                            mColor: kFontGray, mFontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: gapMedium),

          /// 책 보기
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: kBackLightGray,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${titleIntro}",
                    style: subTitle3(), textAlign: TextAlign.center),
                Text("${intro}",
                    style: subTitle3(
                        mColor: kFontGray, mFontWeight: FontWeight.normal)),
                const SizedBox(height: gapMedium),
                Image(
                  image: CachedNetworkImageProvider(
                    "http://172.30.56.249:8080/images/${bookPicUrl}",
                  ),
                  height: getScreenWidth(context) * 0.5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
