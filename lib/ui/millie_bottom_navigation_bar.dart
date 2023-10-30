import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

/// 바텀 네비게이션 바
class MillieBottomNavigationBar extends StatefulWidget {
  const MillieBottomNavigationBar({super.key});

  @override
  State<MillieBottomNavigationBar> createState() =>
      _MillieBottomNavigationBarState();
}

class _MillieBottomNavigationBarState extends State<MillieBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: _selectedIndex,
      backgroundColor: kBackWhite,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kFontGray,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0) {
          Navigator.pushNamed(context, "/nowBooks");
        }
        if (index == 1) {
          /// TODO 은혜 : 피드 페이지 이동 주소 입력
        }
        if (index == 2) {
          /// TODO 은혜 : 검색 페이지 이동 주소 입력
        }
        if (index == 3) {
          Navigator.pushNamed(context, "/myLibraryMain");
        }
        if (index == 4) {
          /// TODO 은혜 : 관리 페이지 이동 주소 입력
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility), label: "투데이"),
        BottomNavigationBarItem(icon: Icon(Icons.forum), label: "피드"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "내서재"),
        BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: "관리"),
      ],
    );
  }
}
