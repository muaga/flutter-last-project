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
        backgroundColor: Colors.transparent,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          color: isSelected ? kFontBlack : kFontGray, // 선택한 상태에 따라 색상 변경
          fontWeight: isSelected ? FontWeight.bold : (fontWeight ?? FontWeight.normal),
          decoration: isSelected ? TextDecoration.underline : TextDecoration.none, // 밑줄 설정
        ),
      ),
    );
  }
}
