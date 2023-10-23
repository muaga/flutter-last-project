import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Center(child: Text("테스트1")),
          Center(child: Text("테스트2")),
          Center(child: Text("테스트3")),
          Center(child: Text("테스트4")),
          Center(child: Text("테스트5")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        backgroundColor: kBackWhite,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kFontGray,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_accessibility), label: "투데이"),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: "피드"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "내서재"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: "관리"),
        ],
      ),
    );
  }
}
