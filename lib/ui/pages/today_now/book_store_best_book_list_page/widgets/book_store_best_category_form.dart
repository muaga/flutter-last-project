import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/book_store_best_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/view-model/book_store_best_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookStoreBestCategoryForm extends ConsumerStatefulWidget {
  BookStoreBestCategoryForm({super.key});

  @override
  _BookStoreBestCategoryFormState createState() =>
      _BookStoreBestCategoryFormState();
}

class _BookStoreBestCategoryFormState
    extends ConsumerState<BookStoreBestCategoryForm> {
  int _pageIndex = 0; // 현재 페이지 인덱스
  final String alignment = "ranking";
  late List<BookListDTO> bookList = [];

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void changeBookList(int categoryId) {
    BookBestReqDTO bookBestReqDTO =
        BookBestReqDTO(bookCategoryId: categoryId, alignment: alignment);
    BookStoreBestBookListModel? model =
        ref.read(bookBestProvider(bookBestReqDTO));
    Logger().d("model = ${model}");
    if (model != null) {
      setState(() {
        bookList = model.bookList!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomCategoryButton(
                        label: "종합",
                        index: 0,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(0);
                          changePage(0);
                        }),
                    CustomCategoryButton(
                        label: "트렌드",
                        index: 1,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(1);
                          changePage(1);
                        }),
                    CustomCategoryButton(
                        label: "라이프",
                        index: 2,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(2);
                          changePage(2);
                        }),
                    CustomCategoryButton(
                        label: "힐링",
                        index: 3,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(3);
                          changePage(3);
                        }),
                    CustomCategoryButton(
                        label: "지적교양",
                        index: 4,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(4);
                          changePage(4);
                        }),
                    CustomCategoryButton(
                        label: "소설",
                        index: 5,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changeBookList(5);
                          changePage(5);
                        }),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: _pageIndex,
              children: [
                BookStoreBestBookGridView(bookList: bookList),
                BookStoreBestBookGridView(bookList: bookList),
                BookStoreBestBookGridView(bookList: bookList),
                BookStoreBestBookGridView(bookList: bookList),
                BookStoreBestBookGridView(bookList: bookList),
                BookStoreBestBookGridView(bookList: bookList),
              ],
            ),
          )
        ],
      ),
    );
  }
}
