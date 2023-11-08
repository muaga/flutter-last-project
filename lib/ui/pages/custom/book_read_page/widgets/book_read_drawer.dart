import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class BookReadDrawer extends StatelessWidget {
  const BookReadDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
