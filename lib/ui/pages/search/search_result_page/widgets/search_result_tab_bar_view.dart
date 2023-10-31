import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_book_and_post_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_book_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_post_form.dart';

class SearchResultTabBarView extends StatelessWidget {
  SearchResultTabBarView({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        /// 통합
        SearchResultBookAndPostForm(tabController: _tabController),

        /// 독서
        SearchResultBookForm(),

        /// 포스트
        SearchResultPostForm(),
      ],
    );
  }
}
