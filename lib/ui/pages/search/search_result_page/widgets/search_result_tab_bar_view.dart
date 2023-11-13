import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_book_and_post_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_book_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_post_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';

class SearchResultTabBarView extends StatelessWidget {
  final TabController? _tabController;
  final List<BookKeywordDTO>? bookList;
  final List<BoardKeywordDTO>? boardList;

  SearchResultTabBarView({
    super.key,
    this.bookList,
    this.boardList,
    required TabController? tabController,
  }) : _tabController = tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        /// 통합
        SearchResultBookAndPostForm(
            tabController: _tabController,
            boardKeywordList: boardList,
            bookKeywordList: bookList),

        /// 독서
        SearchResultBookForm(bookList: bookList),

        /// 포스트
        SearchResultPostForm(boardList: boardList),
      ],
    );
  }
}
