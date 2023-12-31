import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class CustomBookGridView extends StatelessWidget {
  final int? categoryId;
  final List<ReadingBookDTO>? readingBookDTO;
  final List<LikeListDTO>? likeListDTO;
  const CustomBookGridView(
      {this.categoryId, this.readingBookDTO, this.likeListDTO});

  @override
  Widget build(BuildContext context) {
    // 둘 중 null이면 공백
    if (readingBookDTO == null && likeListDTO == null) {
      return Container();
    }

    if (likeListDTO != null) {
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
          itemCount: likeListDTO!.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  int? bookId = likeListDTO![index].bookId;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(bookId: bookId ?? 0)));

                  /// ?가 붙는 변수는 꼭 null일 때의 디폴트값을 명시해줄것
                },
                child: CustomGridBookCard(
                  title: likeListDTO![index].likeBookTitle,
                  writer: likeListDTO![index].likeWriter,
                  picUrl: likeListDTO![index].likeBookPicUrl,
                ));
          },
          // 더 많은 리스트 아이템을 추가할 수 있습니다.
        ),
      );
    } else {
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
          itemCount: readingBookDTO!.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  int? bookId = readingBookDTO![index].bookId;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(bookId: bookId ?? 0)));

                  /// ?가 붙는 변수는 꼭 null일 때의 디폴트값을 명시해줄것
                },
                child: CustomGridBookCard(
                  title: readingBookDTO![index].bookReadingTitle,
                  writer: readingBookDTO![index].readingWriter,
                  picUrl: readingBookDTO![index].bookReadingPicUrl,
                ));
          },
          // 더 많은 리스트 아이템을 추가할 수 있습니다.
        ),
      );
    }
  }
}
