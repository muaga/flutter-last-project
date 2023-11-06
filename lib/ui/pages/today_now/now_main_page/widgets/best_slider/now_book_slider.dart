import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_ranking_book_detail_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_ranking_book_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/reponse_dto/best_book_response_dto_test.dart';

class NowBookSlider extends StatelessWidget {
  NowBookSlider(
      {super.key,
      required this.controller,
      required this.rankingBooks,
      required this.funPageChanged});

  final CarouselController controller;
  List<testBook> rankingBooks;
  final funPageChanged;

  @override
  Widget build(BuildContext context) {
    List<List<testBook>> dividedBooks = [
      rankingBooks.sublist(0, 3), // 첫 번째 슬라이드에 표시할 책
      rankingBooks.sublist(3, 6),
      rankingBooks.sublist(6) // 두 번째 슬라이드에 표시할 책
    ];
    // sublist : List에서 새로운 List로 추출하는 데 사용 : sublist(start index, end? index(미포함))
    return CarouselSlider(
      carouselController: controller,
      items: dividedBooks.asMap().entries.map((entry) {
        final int index = entry.key;
        final List<testBook> books = entry.value;
        return Builder(
          builder: (context) {
            if (index == 1) {
              // index가 1인 경우에 다른 위젯 반환
              return Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: gapSmall),
                  child: Column(
                    children: [
                      NowRankingBookForm(
                        id: books[0].id,
                        rankingId: books[0].rankingId,
                        writer: books[0].writer,
                        title: books[0].title,
                        bookPicUrl: books[0].bookPicUrl,
                        state: books[0].state,
                      ),
                      NowRankingDetailForm(
                        id: books[1].id,
                        rankingId: books[1].rankingId,
                        writer: books[1].writer,
                        title: books[1].title,
                        bookPicUrl: books[1].bookPicUrl,
                        state: books[1].state,
                        intro: books[1].intro,
                        titleIntro: books[1].titleIntro,
                      ),
                      NowRankingBookForm(
                        id: books[2].id,
                        rankingId: books[2].rankingId,
                        writer: books[2].writer,
                        title: books[2].title,
                        bookPicUrl: books[2].bookPicUrl,
                        state: books[2].state,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // index가 1이 아닌 경우 기존 위젯 반환
              return Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: gapSmall),
                  child: Column(
                    children: [
                      NowRankingDetailForm(
                        id: books[0].id,
                        rankingId: books[0].rankingId,
                        writer: books[0].writer,
                        title: books[0].title,
                        bookPicUrl: books[0].bookPicUrl,
                        state: books[0].state,
                        intro: books[0].intro,
                        titleIntro: books[0].titleIntro,
                      ),
                      NowRankingBookForm(
                        id: books[1].id,
                        rankingId: books[1].rankingId,
                        writer: books[1].writer,
                        title: books[1].title,
                        bookPicUrl: books[1].bookPicUrl,
                        state: books[1].state,
                      ),
                      NowRankingBookForm(
                        id: books[2].id,
                        rankingId: books[2].rankingId,
                        writer: books[2].writer,
                        title: books[2].title,
                        bookPicUrl: books[2].bookPicUrl,
                        state: books[2].state,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 600,
        viewportFraction: 1.0,
        autoPlay: false,
        // autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: funPageChanged,
      ),
    );
  }
}
