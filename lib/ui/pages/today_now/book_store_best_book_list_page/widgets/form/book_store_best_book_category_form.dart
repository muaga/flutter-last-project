import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/book_store_best_book_grid_view.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';

class BookStoreBestBookCategoryForm extends StatefulWidget {
  BookStoreBestBookCategoryForm({super.key});

  @override
  State<BookStoreBestBookCategoryForm> createState() =>
      _BookStoreBestBookCategoryFormState();
}

class _BookStoreBestBookCategoryFormState
    extends State<BookStoreBestBookCategoryForm> {
  int _pageIndex = 0; // 현재 페이지 인덱스

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
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
                          changePage(0);
                        }),
                    CustomCategoryButton(
                        label: "트렌드",
                        index: 1,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changePage(1);
                        }),
                    CustomCategoryButton(
                        label: "라이프",
                        index: 2,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changePage(2);
                        }),
                    CustomCategoryButton(
                        label: "힐링",
                        index: 3,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changePage(3);
                        }),
                    CustomCategoryButton(
                        label: "지적교양",
                        index: 4,
                        pageIndex: _pageIndex,
                        onPress: () {
                          changePage(4);
                        }),
                    CustomCategoryButton(
                        label: "소설",
                        index: 5,
                        pageIndex: _pageIndex,
                        onPress: () {
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
                BookStoreBestBookGridView(categoryId: 0),
                BookStoreBestBookGridView(categoryId: 1),
                BookStoreBestBookGridView(categoryId: 2),
                BookStoreBestBookGridView(categoryId: 3),
                BookStoreBestBookGridView(categoryId: 4),
                BookStoreBestBookGridView(categoryId: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
