import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/search_result_tab_bar_view.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';
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
<<<<<<< HEAD
    return FutureBuilder<SearchResultModel>(
      future: fetchModel(ref), // 비동기 함수 호출
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 로딩 중일 때의 화면
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 에러 발생 시의 화면
          Logger().d(snapshot.error);
=======
    BookSearchReqDTO bookSearchReqDTO = BookSearchReqDTO(keyword: searchText);
    Logger().d("bookSearchReqDTO : ${bookSearchReqDTO.keyword}");

    SearchResultModel? model = ref.read(searchProvider(bookSearchReqDTO));
    Logger().d("model : ${model}");
>>>>>>> dev

          return Text('Error: ${snapshot.error}');
        } else {
          // 성공 시의 화면
          SearchResultModel model = snapshot.data!;
          List<BookKeywordDTO>? bookList = model.bookKeywordList;
          List<BoardKeywordDTO>? boardList = model.boardKeywordList;

          // 나머지 화면 구성 코드
          return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  CustomTextFormFieldSearchBar(searchText: searchText),
                  SearchResultTabBar(tabController: _tabController),
                ];
              },
              body: SearchResultTabBarView(
                  tabController: _tabController,
                  boardList: boardList,
                  bookList: bookList));
        }
      },
    );
  }

  Future<SearchResultModel> fetchModel(WidgetRef ref) async {
    BookSearchReqDTO bookSearchReqDTO = BookSearchReqDTO(keyword: searchText);

    SearchResultModel model = await ref
        .read(searchProvider(bookSearchReqDTO).notifier)
        .notifyInit(bookSearchReqDTO);

    return model;
  }
}
