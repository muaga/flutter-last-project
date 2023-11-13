import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class OneMonthBookGridView extends StatelessWidget {
  List<BookListDTO> bookList;
  OneMonthBookGridView({required this.bookList});

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
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                int? bookId = bookList[index].bookId;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(bookId: bookId ?? 0)));

                /// ?가 붙는 변수는 꼭 null일 때의 디폴트값을 명시해줄것
              },
              child: CustomGridBookCard(
                title: bookList[index].bookTitle,
                writer: bookList[index].bookWriter,
                picUrl: bookList[index].bookPicUrl,
              ));
        },
        // 더 많은 리스트 아이템을 추가할 수 있습니다.
      ),
    );
  }
}
