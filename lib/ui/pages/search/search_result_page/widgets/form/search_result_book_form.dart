import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_title.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/Custom_book_grid_view.dart';

class SearchResultBookForm extends StatelessWidget {
  const SearchResultBookForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchResultTitle(title: "검색결과", count: 2),
        Expanded(child: CustomBookGridView(books: books)),
      ],
    );
  }
}
