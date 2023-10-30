import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class BookReadPage extends StatefulWidget {
  const BookReadPage({Key? key});

  @override
  _BookReadPageState createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  String appBarTitle = "page1"; // 초기 타이틀

  void showPopupMenu(BuildContext context) {
    showMenu(
        context: context,
        position: RelativeRect.fill,
        items: <PopupMenuEntry>[
          PopupMenuItem(
            value: 1,
            child: Text("메뉴 항목 1"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("메뉴 항목 2"),
          ),
        ]).then((value) {
      if (value == 1) {
        setState(() {
          appBarTitle = "메뉴 항목 1"; // 상태 변경
        });
      } else if (value == 2) {
        setState(() {
          appBarTitle = "메뉴 항목 2"; // 상태 변경
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "page1"; // 추가
    return Scaffold(
      endDrawer: Drawer(
        // endDrawer 내부에 원하는 내용을 추가하세요.
        child: ListView(
          children: [
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
            // 다른 메뉴 항목 추가
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: InkWell(
          child: Text(appBarTitle),
          onTap: () {
            showPopupMenu(context);
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: iconBookMartOutline()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              EndDrawerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
