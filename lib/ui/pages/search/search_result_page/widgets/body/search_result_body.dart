import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar_view.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_main_view_model.dart';
import 'package:flutter_blog/ui/widgets/bar/custom_text_form_field_search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class SearchResultBody extends ConsumerWidget {
  const SearchResultBody({
    super.key,
    required this.searchText,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final String searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookSearchReqDTO bookSearchReqDTO = BookSearchReqDTO(keyword: searchText);
    Logger().d("bookSearchReqDTO : ${bookSearchReqDTO.keyword}");
    SearchResultModel? model = ref.read(searchProvider(bookSearchReqDTO));
    Logger().d("model : ${model}");

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
