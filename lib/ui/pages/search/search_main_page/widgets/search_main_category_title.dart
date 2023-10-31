import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class SearchMainCategoryTitle extends StatelessWidget {
  const SearchMainCategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      elevation: 0.5,
      pinned: true,
      floating: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: gapMedium),
          child: Text(
            "카테고리",
            style: subTitle1(),
          ),
        ),
      ),
    );
  }
}
