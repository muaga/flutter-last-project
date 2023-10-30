import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar_view.dart';
import 'package:flutter_blog/ui/widgets/bar/custom_text_form_field_search_bar.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({
    super.key,
    required this.searchText,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomTextFormFieldSearchBar(searchText: searchText),
            SearchResultTabBar(tabController: _tabController),
          ];
        },
        body: SearchResultTabBarView(tabController: _tabController));
  }
}
