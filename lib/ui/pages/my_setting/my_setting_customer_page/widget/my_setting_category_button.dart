import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class MySettingCategoryButton extends StatelessWidget {
  final String label;
  final int index;
  final int pageIndex;
  final VoidCallback onPress;
  final FontWeight? fontWeight;
  const MySettingCategoryButton(
      {required this.label,
        required this.index,
        required this.pageIndex,
        required this.onPress,
        this.fontWeight});

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == pageIndex;

    return TextButton(
      onPressed: () {
        onPress();
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: isSelected ? kBackBlack : Colors.transparent, // 선택한 상태에 따라 배경색 변경
        side: BorderSide(color: Colors.black),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          color: isSelected ? kFontWhite : kFontGray, // 선택한 상태에 따라 색상 변경
          fontWeight: isSelected ? FontWeight.bold : (fontWeight ?? FontWeight.normal),
        ),
      ),
    );
  }
}
