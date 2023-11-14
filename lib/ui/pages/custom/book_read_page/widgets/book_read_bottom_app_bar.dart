import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

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
        children: <Widget>[
          Slider(
            thumbColor: kFontBlack,
            inactiveColor: kFontLightGray,
            activeColor: kFontGray,
            value: widget.pageController.page ?? widget.sliderValue, // 슬라이더 값
            onChanged: (value) {
              setState(() {
                widget.sliderValue = value;
              });

              // Logger().d("value 슬라이더 : ${value} ");
              // Logger().d("currentPage 슬라이더 : ${widget.currentPage} ");
              // Logger().d("pageController 슬라이더 : ${widget.pageController.page}");
            },
            onChangeEnd: (value) {
              // 페이지뷰를 해당 페이지로 이동
              setState(() {
                widget.pageController.animateToPage(
                  widget.sliderValue.toInt(),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              });
            },
            min: 0.0, // 최소 값
            max: widget.totalPages.toDouble(), // 최대 값 (전체 페이지 수)
            divisions: max(1, widget.totalPages), // 분할 수 (1 이상의 값으로 설정
          ),
          Padding(
            padding: EdgeInsets.only(bottom: gapMain),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(widget.pageController.page!.toInt() + 1) ?? (widget.sliderValue.toInt() + 1)}",
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
          ),
        ],
      ),
    );
  }
}
