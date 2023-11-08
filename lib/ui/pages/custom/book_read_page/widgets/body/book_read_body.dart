import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:logger/logger.dart';

class BookReadBody extends StatefulWidget {
  BookReadBody(
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
  State<BookReadBody> createState() => _BookReadBodyState();
}

class _BookReadBodyState extends State<BookReadBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: InkWell(
            child: Text('Page ${widget.currentPage + 1}'),
            onTap: () {
              showPopupMenu(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (widget.savedPage != -1) {
                  // 유효한 페이지가 저장되어 있는지 확인한 후 저장된 페이지로 이동
                  widget.pageController.jumpToPage(widget.savedPage);
                }
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                // 현재 페이지를 북마크로 저장
                widget.savedPage = widget.currentPage;
                Logger().d(widget.savedPage);

                setState(() {
                  // 슬라이더 값을 초기화합니다.
                  widget.sliderValue = widget.currentPage.toDouble();
                });
              },
              icon: iconBookMartOutline(),
            ),
          ],
          floating: false,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            child: PageView.builder(
              controller: widget.pageController,
              onPageChanged: (int page) {
                setState(() {
                  widget.currentPage = page;
                  widget.sliderValue = page.toDouble();
                });
              },
              itemCount: widget.totalPages, // 전체 페이지 수로 변경
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Page ${index + 1}'),
                  ),
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
