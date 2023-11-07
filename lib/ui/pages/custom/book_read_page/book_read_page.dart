import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class BookReadPage extends StatefulWidget {
  const BookReadPage({Key? key}) : super(key: key);

  @override
  _BookReadPageState createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  late PageController pageController;
  int currentPage = 0;
  double sliderValue = 0.0;
  int totalPages = 100; // 전체 페이지 수
  int savedPage = -1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            // Drawer contents
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 70,
                      height: 100,
                      color: Colors.black,
                    ),
                    SizedBox(width: gapMedium),
                    Column(
                      children: [
                        Text("제목"),
                        Text("작가"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomThinLine(),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(gapMain),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          iconBookMartOutline(),
                          SizedBox(width: gapMedium),
                          Text(
                            "북마크",
                            style: subTitle1(mFontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: iconArrowForward(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomThickLine(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("홈"),
              onTap: () {
                // 홈 화면으로 이동하거나 다른 작업 수행
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("내 서재"),
              onTap: () {
                // 내 서재 화면으로 이동하거나 다른 작업 수행
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("설정"),
              onTap: () {
                // 설정 화면으로 이동하거나 다른 작업 수행
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: InkWell(
              child: Text('Page ${currentPage + 1}'),
              onTap: () {
                showPopupMenu(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (savedPage != -1) {
                    // 유효한 페이지가 저장되어 있는지 확인한 후 저장된 페이지로 이동
                    pageController.jumpToPage(savedPage);
                  }
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  // 현재 페이지를 북마크로 저장
                  savedPage = currentPage;

                  setState(() {
                    // 슬라이더 값을 초기화합니다.
                    sliderValue = currentPage.toDouble();
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
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                    sliderValue = page.toDouble();
                  });
                },
                itemCount: totalPages, // 전체 페이지 수로 변경
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Slider(
              thumbColor: kFontBlack,
              inactiveColor: kFontLightGray,
              activeColor: kFontGray,
              value: sliderValue, // 슬라이더 값
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                  currentPage = value.round();
                });

                // 페이지뷰를 해당 페이지로 이동
                pageController.animateToPage(
                  currentPage,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              min: 0.0, // 최소 값
              max: totalPages.toDouble() - 1, // 최대 값 (전체 페이지 수 - 1)
              divisions: totalPages - 1, // 분할 수 (전체 페이지 수 - 1)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${currentPage + 1}",
                  style: subTitle2(),
                ),
                Text(
                  ' / ',
                  style: subTitle2(mColor: kFontGray),
                ),
                Text(
                  '$totalPages', // 전체 페이지 수 표시
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
      ),
    );
  }

  void showPopupMenu(BuildContext context) {
    List<PopupMenuEntry<int>> menuItems = [];

    for (int i = 0; i < totalPages; i++) {
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
          currentPage = value;
          pageController.jumpToPage(value);
          sliderValue = value.toDouble(); // 슬라이더 값 업데이트
        });
      }
    });
  }
}
