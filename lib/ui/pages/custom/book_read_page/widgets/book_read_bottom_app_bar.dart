import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class BookReadBottomAppBar extends StatefulWidget {
  BookReadBottomAppBar(
      {required this.pageController,
      required this.currentPage,
      required this.sliderValue,
      required this.totalPages,
      required this.savedPage,
      super.key});

  final PageController pageController;
  int currentPage;
  double sliderValue;
  final int totalPages;
  int savedPage;

  @override
  State<BookReadBottomAppBar> createState() => _BookReadBottomAppBarState();
}

class _BookReadBottomAppBarState extends State<BookReadBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Slider(
            thumbColor: kFontBlack,
            inactiveColor: kFontLightGray,
            activeColor: kFontGray,
            value: widget.sliderValue, // 슬라이더 값
            onChanged: (value) {
              setState(() {
                widget.sliderValue = value;
                widget.currentPage = value.round();
              });

              // 페이지뷰를 해당 페이지로 이동
              widget.pageController.animateToPage(
                widget.currentPage,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            min: 0.0, // 최소 값
            max: widget.totalPages.toDouble() - 1, // 최대 값 (전체 페이지 수 - 1)
            divisions: widget.totalPages - 1, // 분할 수 (전체 페이지 수 - 1)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.currentPage + 1}",
                style: subTitle2(),
              ),
              Text(
                ' / ',
                style: subTitle2(mColor: kFontGray),
              ),
              Text(
                "${widget.totalPages}", // 전체 페이지 수 표시
                style: subTitle2(mColor: kFontGray),
              ),
            ],
          ),
          Flexible(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  EndDrawerButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
