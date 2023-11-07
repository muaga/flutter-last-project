import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';

import 'widgets/search_category_book_list_body.dart';

class SearchCategoryBookListPage extends StatelessWidget {
  const SearchCategoryBookListPage(
      {super.key, required this.title, required this.categoryId});

  final String title;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("${title}"),
        elevation: 0.5,
      ),
      body: SearchCategoryBookListBody(),
    );
  }
}
