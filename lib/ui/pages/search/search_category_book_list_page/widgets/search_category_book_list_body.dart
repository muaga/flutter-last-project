import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/search_category_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCategoryBookListBody extends ConsumerWidget {
  final int categoryId;
  const SearchCategoryBookListBody({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookCategoryReqDTO bookCategoryReqDTO = BookCategoryReqDTO(
        bookCategoryId: categoryId, alignment: "ranking", minusMonths: 12);

    SearchCategoryBookListModel? model =
        ref.read(searchCategoryProvider(bookCategoryReqDTO));

    List<ByCategoryPage>? bookList;
    if (model != null) {
      bookList = model.byCategoryPages;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: gapXlarge, vertical: gapMain),
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
}
