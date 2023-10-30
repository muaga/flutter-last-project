import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBookGridView extends ConsumerWidget {
  final int? categoryId;
  const CustomBookGridView({this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // BookListModel? model = ref.watch(bookListProvider);
    // List<Book> books = [];
    // if (model == null) {
    //   return Center(child: CircularProgressIndicator());
    // } else {
    //   books = model.books;
    // }

    List<Book> books = [
      Book(
          id: 1,
          picUrl: "book1.png",
          title: "트렌드코리아 2024",
          writer: "김난도",
          totalPage: "410",
          publicationDate: "2023-10-01",
          createdAt: "2023-10-01",
          subTitle: "2024 대한민국 소비트렌드 전망",
          introduction: "트렌드코리아 소개",
          sequence: "트렌드코리아 목차",
          writerIntroductoin: "트렌드코리아 작가 소개",
          review: "트렌드코리아 출판사 서평",
          ranking: 1,
          bookCategoryId: 1,
          bookDataId: 1),
      Book(
          id: 2,
          picUrl: "book2.png",
          title: "퓨처셀프",
          writer: "벤저민",
          totalPage: "100",
          publicationDate: "2023-10-05",
          createdAt: "2023-10-05",
          subTitle: "현재와 미래가 달라지는 놀라운 혁명",
          introduction: "퓨처셀프 소개",
          sequence: "퓨처셀프 목차",
          writerIntroductoin: "퓨처셀프 작가 소개",
          review: "퓨처셀프 출판사 서평",
          ranking: 2,
          bookCategoryId: 2,
          bookDataId: 1),
      Book(
          id: 3,
          picUrl: "book3.png",
          title: "시대예보:핵개인의 시대",
          writer: "송길영",
          totalPage: "100",
          publicationDate: "2023-10-20",
          createdAt: "2023-10-20",
          subTitle: "현재와 미래가 달라지는 놀라운 혁명",
          introduction: "시대예보 소개",
          sequence: "시대예보 목차",
          writerIntroductoin: "시대예보 작가 소개",
          review: "시대예보 출판사 서평",
          ranking: 3,
          bookCategoryId: 1,
          bookDataId: 1),
      Book(
          id: 4,
          picUrl: "book4.png",
          title: "설자은, 금성으로 돌아오다",
          writer: "정세랑",
          totalPage: "100",
          publicationDate: "2023-10-20",
          createdAt: "2023-10-20",
          subTitle: "현재와 미래가 달라지는 놀라운 혁명",
          introduction: "설자은 소개",
          sequence: "설자은 목차",
          writerIntroductoin: "설자은 작가 소개",
          review: "설자은 출판사 서평",
          ranking: 4,
          bookCategoryId: 1,
          bookDataId: 1),
      Book(
          id: 5,
          picUrl: "book5.png",
          title: "책으로 가는 문",
          writer: "미야자키 하야오",
          totalPage: "100",
          publicationDate: "2023-10-25",
          createdAt: "2023-10-25",
          subTitle: "현재와 미래가 달라지는 놀라운 혁명",
          introduction: "책으로 소개",
          sequence: "책으로 목차",
          writerIntroductoin: "책으로 작가 소개",
          review: "책으로 출판사 서평",
          ranking: 25,
          bookCategoryId: 1,
          bookDataId: 1),
      Book(
          id: 6,
          picUrl: "book6.png",
          title: "로마 이야기",
          writer: "줌파 라히리",
          totalPage: "100",
          publicationDate: "2023-10-05",
          createdAt: "2023-10-05",
          subTitle: "현재와 미래가 달라지는 놀라운 혁명",
          introduction: "로마 이야기 소개",
          sequence: "로마 이야기 목차",
          writerIntroductoin: "로마 이야기 작가 소개",
          review: "로마 이야기 출판사 서평",
          ranking: 6,
          bookCategoryId: 1,
          bookDataId: 1),
    ];

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
              child: CustomGridBookCard(books[index]));
        },
        // 더 많은 리스트 아이템을 추가할 수 있습니다.
      ),
    );
  }
}
