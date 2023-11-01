import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomTabBarViewTitleAndForwordForm extends StatelessWidget {
  const CustomTabBarViewTitleAndForwordForm({
    super.key,
    required this.title,
    this.count,
    required this.animeTo,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final String title;
  final int? count;
  final int animeTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${title}  ${count}",
                style: subTitle2(),
              ),
              IconButton(
                onPressed: () {
                  _tabController?.animateTo(animeTo);
                },
                icon: iconArrowForward(),
              ),
            ],
          )),
    );
  }
}
