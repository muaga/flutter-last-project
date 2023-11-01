import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTabBarMenu extends StatelessWidget {
  final String tabBarText;
  const CustomTabBarMenu({required this.tabBarText});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabBarText,
        style: subTitle2(mColor: kFontBlack, mFontWeight: FontWeight.normal),
      ),
    );
  }
}
