import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/body/one_month_press_book_list_body.dart';

class OneMonthPressBookListPage extends StatelessWidget {
  const OneMonthPressBookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: iconArrowBack()),
          title: Text("한 달 이내에 출간된 책"),
        ),
        // bottomNavigationBar: MillieBottomNavigationBar(),
        body: OneMonthPressBookListBody());
  }
}
