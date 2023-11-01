import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/form/custom_post_list_form.dart';
import 'package:flutter_blog/ui/widgets/form/custom_tab_bar_view_title_and_forword_button.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/Custom_book_grid_view.dart';

class SearchResultBookAndPostForm extends StatelessWidget {
  const SearchResultBookAndPostForm({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBarViewTitleAndForwordForm(
            tabController: _tabController, title: "독서", animeTo: 1, count: 2),
        Expanded(child: CustomBookGridView()),
        CustomTabBarViewTitleAndForwordForm(
            title: "포스트", animeTo: 2, tabController: _tabController, count: 2),
        Expanded(child: CustomPostListForm()),
      ],
    );
  }
}
