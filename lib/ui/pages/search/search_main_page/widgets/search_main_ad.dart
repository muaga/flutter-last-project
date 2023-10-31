import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';

class SearchMainAd extends StatelessWidget {
  const SearchMainAd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Book book = Book(
        id: 2,
        picUrl: "book2.png",
        title: "퓨처셀프",
        writer: "벤저민",
        totalPage: "100",
        publicationDate: "2023-10-05",
        createdAt: "2023-10-05",
        subTitle: "현재와 미래가 달라지는 놀라운 혁명",
        introduction: "퓨처셀프 소개",
        sequence: "퓨처셀프 목차",
        writerIntroductoin: "퓨처셀프 작가 소개",
        review: "퓨처셀프 출판사 서평",
        ranking: 2,
        bookCategoryId: 2,
        bookDataId: 1);

    return SliverToBoxAdapter(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: gapXlarge, horizontal: gapXlarge),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BookDetailPage(bookId: book.id ?? 0)));
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white, // 컨테이너의 배경색
              boxShadow: [
                BoxShadow(
                  color: kBackGray, // 그림자의 색상
                  offset: Offset(0, 1), // 그림자의 위치 (x, y)
                  blurRadius: 5.0, // 그림자의 흐림 정도
                  spreadRadius: 1.0, // 그림자의 확산 정도
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.all(gapLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${book.title}", style: subTitle2()),
                        SizedBox(height: 5),
                        Text(
                          "${book.subTitle}",
                          style: body1(mFontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: gapLarge),
                  child: Container(
                    height: 100,
                    width: 70,
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://192.168.0.37:8080/images/${book.picUrl}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
