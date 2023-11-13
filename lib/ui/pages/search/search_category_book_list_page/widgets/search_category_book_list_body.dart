import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/search_category_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class SearchCategoryBookListBody extends ConsumerWidget {
  final int categoryId;
  const SearchCategoryBookListBody({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<SearchCategoryBookListModel>(
      future: fetchModel(ref), // 비동기 함수 호출
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 로딩 중일 때의 화면
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 에러 발생 시의 화면
          Logger().d(snapshot.error);

          return Text('Error: ${snapshot.error}');
        } else {
          // 성공 시의 화면
          SearchCategoryBookListModel model = snapshot.data!;
          List<ByCategoryPage>? bookList = model.byCategoryPages;

          // 나머지 화면 구성 코드
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: gapXlarge, vertical: gapMain),
                  child: Text("총 ${bookList?.length}권", style: subTitle2())),
              CustomThinLine(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: gapMain),
                  child: SearchCategoryBookGridView(bookList: bookList),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<SearchCategoryBookListModel> fetchModel(WidgetRef ref) async {
    SearchCategoryBookListModel model = await ref
        .read(searchCategoryProvider(categoryId).notifier)
        .notifyInit(categoryId);

    return model;
  }
}
