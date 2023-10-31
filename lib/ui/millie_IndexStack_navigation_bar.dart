import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/feed_main_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_page.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/my_setting_main_page.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/search_main_page.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/body/search_main_body.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/now_main_page.dart';
import 'package:logger/logger.dart';

/// 바텀 네비게이션 바
class MillieIndexStackNavigationBar extends StatefulWidget {
  const MillieIndexStackNavigationBar({super.key});

  @override
  State<MillieIndexStackNavigationBar> createState() =>
      _MillieIndexStackNavigationBarState();
}

class _MillieIndexStackNavigationBarState
    extends State<MillieIndexStackNavigationBar> {
  int _selectedIndex = 0;
  int _previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            NowMainPage(),
            FeedMainPage(),
            SearchMainPage(),
            MyLibraryMainPage(),
            MySettingMainPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _selectedIndex,
          backgroundColor: kBackWhite,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kFontGray,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              // _previousIndex = _selectedIndex;
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_accessibility), label: "투데이"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.today), label: "피드"),
            BottomNavigationBarItem(
                icon: Icon(Icons.manage_search), label: "검색"),
            BottomNavigationBarItem(icon: Icon(Icons.shelves), label: "내서재"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: "관리"),
          ],
        ));
  }
}
