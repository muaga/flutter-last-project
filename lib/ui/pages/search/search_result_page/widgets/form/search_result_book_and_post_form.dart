import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_post_list_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';
import 'package:flutter_blog/ui/widgets/form/custom_tab_bar_view_title_and_forword_button.dart';

class SearchResultBookAndPostForm extends StatelessWidget {
  const SearchResultBookAndPostForm({
    super.key,
    this.boardKeywordList,
    this.bookKeywordList,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final List<BookKeywordDTO>? bookKeywordList;
  final List<BoardKeywordDTO>? boardKeywordList;

  @override
  Widget build(BuildContext context) {
    final List<BookKeywordDTO> sixBooks =
        bookKeywordList!.take(6).toList(); // book 최대 6개만 가능
    final List<BoardKeywordDTO> sixBoards = boardKeywordList!.take(6).toList();
    return Column(
      children: [
        CustomTabBarViewTitleAndForwordForm(
            tabController: _tabController,
            title: "독서",
            animeTo: 1,
            count: bookKeywordList!.length),
        Expanded(child: SearchResultBookGridView(bookList: sixBooks)),
        CustomTabBarViewTitleAndForwordForm(
            title: "포스트",
            animeTo: 2,
            tabController: _tabController,
            count: boardKeywordList!.length),
        Expanded(child: SearchResultPostListForm(boardList: sixBoards)),
      ],
    );
  }
}
