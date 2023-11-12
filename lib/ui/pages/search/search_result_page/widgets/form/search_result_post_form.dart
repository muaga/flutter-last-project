import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/form/search_result_post_list_form.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_title.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';

class SearchResultPostForm extends StatelessWidget {
  const SearchResultPostForm({super.key, this.boardList});

  final List<BoardKeywordDTO>? boardList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchResultTitle(title: "검색결과", count: boardList?.length),
        Expanded(
          child: SearchResultPostListForm(boardList: boardList),
        ),
      ],
    );
  }
}
