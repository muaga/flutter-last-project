import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:logger/logger.dart';

/// 바텀 네비게이션 바
class MillieBottomNavigationBar extends StatefulWidget {
  const MillieBottomNavigationBar({super.key});

  @override
  State<MillieBottomNavigationBar> createState() =>
      _MillieBottomNavigationBarState();
}

class _MillieBottomNavigationBarState extends State<MillieBottomNavigationBar> {
  int _selectedIndex = 0;
  int _previousIndex = 0;

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
          _previousIndex = _selectedIndex;
          _selectedIndex = index;
          if (_selectedIndex == 0) {
            if (_selectedIndex != _previousIndex) {
              setState(() {
                _previousIndex = _selectedIndex;
              });
            }
          }
          if (_selectedIndex == 1) {
            if (_selectedIndex != _previousIndex) {
              setState(() {
                _previousIndex = _selectedIndex;
              });
            }
          }
          if (_selectedIndex == 2) {
            if (_selectedIndex != _previousIndex) {
              Navigator.popAndPushNamed(context, "/searchMain");
              setState(() {
                _previousIndex = _selectedIndex;
              });
            }
          }
          if (_selectedIndex == 3) {
            if (_selectedIndex != _previousIndex) {
              Navigator.popAndPushNamed(context, "/myLibraryMain");
              setState(() {
                _previousIndex = _selectedIndex;
              });
            }
          }
          if (_selectedIndex == 4) {
            if (_selectedIndex != _previousIndex) {
              setState(() {
                _previousIndex = _selectedIndex;
              });
            }
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility), label: "투데이"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.today), label: "피드"),
        BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: "검색"),
        BottomNavigationBarItem(icon: Icon(Icons.shelves), label: "내서재"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), label: "관리"),
      ],
    );
  }
}
