import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';

class CustomCategoryForm extends StatefulWidget {
  const CustomCategoryForm({super.key});

  @override
  State<CustomCategoryForm> createState() => _CustomCategoryBarState();
}

class _CustomCategoryBarState extends State<CustomCategoryForm> {
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
                CustomBookGridView(categoryId: 0),
                CustomBookGridView(categoryId: 1),
                CustomBookGridView(categoryId: 2),
                CustomBookGridView(categoryId: 3),
                CustomBookGridView(categoryId: 4),
                CustomBookGridView(categoryId: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
