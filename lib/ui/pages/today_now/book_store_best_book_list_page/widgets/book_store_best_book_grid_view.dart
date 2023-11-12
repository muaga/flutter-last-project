import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class BookStoreBestBookGridView extends StatelessWidget {
  final int? categoryId;
  const BookStoreBestBookGridView({this.categoryId});

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
        itemCount: books.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                int? bookId = books[index].id;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(bookId: bookId ?? 0)));

                /// ?가 붙는 변수는 꼭 null일 때의 디폴트값을 명시해줄것
              },
              child: CustomGridBookCard(
                title: books[index].title,
                writer: books[index].writer,
                picUrl: books[index].picUrl,
              ));
        },
        // 더 많은 리스트 아이템을 추가할 수 있습니다.
      ),
    );
  }
}
