import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/today_now/now_book_list_page/widgets/body/now_book_list_body.dart';

class NowBookListPage extends StatelessWidget {
  const NowBookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: iconArrowBack()),
          title: Text("한 달 이내에 출간된 책"),
        ),
        // bottomNavigationBar: MillieBottomNavigationBar(),
        body: Stack(
          children: [
            // 책 목록 화면
            NowBookListBody(),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: MillieBottomNavigationBar(),
            ),
          ],
        ));
  }
}
