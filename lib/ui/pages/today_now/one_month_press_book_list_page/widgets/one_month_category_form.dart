import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/one_month_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class OneMonthCategoryForm extends ConsumerStatefulWidget {
  OneMonthCategoryForm({super.key});

  @override
  _OneMonthCategoryFormState createState() => _OneMonthCategoryFormState();
}

class _OneMonthCategoryFormState extends ConsumerState<OneMonthCategoryForm> {
  int _pageIndex = 0; // 현재 페이지 인덱스
  final String alignment = "ranking";
  late List<BookListDTO> bookList;

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void changeBookList(int categoryId) {
    BookMonthReqDTO bookMonthReqDTO =
        BookMonthReqDTO(bookCategoryId: categoryId, alignment: alignment);
    OneMonthPressBookListModel? model =
        ref.read(oneMonthPressProvider(bookMonthReqDTO));
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
                OneMonthBookGridView(bookList: bookList),
                OneMonthBookGridView(bookList: bookList),
                OneMonthBookGridView(bookList: bookList),
                OneMonthBookGridView(bookList: bookList),
                OneMonthBookGridView(bookList: bookList),
                OneMonthBookGridView(bookList: bookList),
              ],
            ),
          )
        ],
      ),
    );
  }
}
