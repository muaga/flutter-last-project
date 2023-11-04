import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/best_book_response_dto_test.dart';

class NowSliderIndicator extends StatelessWidget {
  NowSliderIndicator(
      {super.key,
      required this.controller,
      required this.current,
      required this.rankingBooks});

  final CarouselController controller;
  int current;
  List<testBook> rankingBooks;

  @override
  Widget build(BuildContext context) {
    List<List<testBook>> dividedBooks = [
      rankingBooks.sublist(0, 3), // 첫 번째 슬라이드에 표시할 책
      rankingBooks.sublist(3, 6),
      rankingBooks.sublist(6) // 두 번째 슬라이드에 표시할 책
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dividedBooks.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () {
              if (entry.key < dividedBooks.length) {
                controller.animateToPage(entry.key);
              }
            },
            child: Container(
              width: getScreenWidth(context) * 0.25,
              height: 2,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                color:
                    Colors.black.withOpacity(current == entry.key ? 0.9 : 0.1),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
