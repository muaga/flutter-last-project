import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_title.dart';
import 'package:flutter_blog/ui/widgets/form/custom_post_list_form.dart';

class SearchResultPostForm extends StatelessWidget {
  const SearchResultPostForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchResultTitle(title: "검색결과", count: boards.length),
        Expanded(
          child: CustomPostListForm(boards: boards),
        ),
      ],
    );
  }
}
