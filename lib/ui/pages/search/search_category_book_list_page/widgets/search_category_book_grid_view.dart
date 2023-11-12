import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class SearchCategoryBookGridView extends StatelessWidget {
  // TODO 은혜 : 여기서 카테고리 Id로 알아오기
  final List<ByCategoryPage>? bookList;
  const SearchCategoryBookGridView({required this.bookList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 2,
        ),
        itemCount: bookList?.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                int? bookId = bookList?[index].bookId;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(bookId: bookId ?? 0)));

                /// ?가 붙는 변수는 꼭 null일 때의 디폴트값을 명시해줄것
              },
              child: CustomGridBookCard(
                picUrl: bookList![index].bookPicUrl,
                writer: bookList![index].bookWriter,
                title: bookList![index].bookTitle,
              ));
        },
        // 더 많은 리스트 아이템을 추가할 수 있습니다.
      ),
    );
  }
}
