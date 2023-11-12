import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_title.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';

class SearchResultBookForm extends StatelessWidget {
  const SearchResultBookForm({super.key, this.bookList});

  final List<BookKeywordDTO>? bookList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchResultTitle(title: "검색결과", count: bookList?.length),
        Expanded(child: SearchResultBookGridView(bookList: bookList)),
      ],
    );
  }
}
