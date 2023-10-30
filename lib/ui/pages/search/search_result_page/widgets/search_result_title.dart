import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class SearchResultTitle extends StatelessWidget {
  final String title;
  final int? count;
  const SearchResultTitle({
    required this.title,
    this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${title} ${count ?? ""}", style: subTitle2()),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(16),
    );
  }
}
