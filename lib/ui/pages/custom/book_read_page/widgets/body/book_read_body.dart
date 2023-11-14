import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BookReadBody extends StatefulWidget {
  BookReadBody(
      {required this.pageController,
      required this.currentPage,
      required this.sliderValue,
      required this.totalPages,
      required this.savedPage,
      required this.bookData,
      super.key});

  final PageController pageController;
  int currentPage;
  double sliderValue;
  final int totalPages;
  int savedPage;
  List<String> bookData;
  // 휴대폰 저장
  final secureStorage = FlutterSecureStorage();

  @override
  State<BookReadBody> createState() => _BookReadBodyState();
}

class _BookReadBodyState extends State<BookReadBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            color: Colors.transparent,
            child: PageView.builder(
              controller: widget.pageController,
              onPageChanged: (int page) {
                setState(() {
                  widget.currentPage = page.round();
                  widget.sliderValue = page.roundToDouble();
                });
              },
              itemCount: widget.totalPages, // 전체 페이지 수로 변경
              itemBuilder: (context, index) {
                return Container(
                  height: getScreenHeight(context) * 0.88,
                  width: getScreenWidth(context),
                  child: Text("${widget.bookData[index]}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'D2Coding', fontSize: 21, height: 1.4)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void showPopupMenu(BuildContext context) {
    List<PopupMenuEntry<int>> menuItems = [];

    for (int i = 0; i < widget.totalPages; i++) {
      menuItems.add(
        PopupMenuItem(
          value: i,
          child: Container(
            height: 20,
            child: Text("페이지 ${i + 1}"),
          ),
        ),
      );
    }

    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: menuItems,
    ).then((value) {
      if (value != null) {
        setState(() {
          widget.currentPage = value;
          widget.pageController.jumpToPage(value);
          widget.sliderValue = value.toDouble(); // 슬라이더 값 업데이트
        });
      }
    });
  }
}
