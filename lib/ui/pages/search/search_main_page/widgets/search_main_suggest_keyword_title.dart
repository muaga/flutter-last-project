import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class SearchMainSuggestKeywordTitle extends StatelessWidget {
  const SearchMainSuggestKeywordTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text("밀리 추천 검색어", style: title1()),
    ));
  }
}
