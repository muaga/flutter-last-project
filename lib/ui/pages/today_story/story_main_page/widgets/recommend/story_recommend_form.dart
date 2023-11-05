import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/recommend/story_category_slider.dart';
import 'package:flutter_blog/ui/widgets/button/custom_category_button.dart';

class StoryRecommendForm extends StatefulWidget {
  StoryRecommendForm({super.key, required this.books});
  List<Book> books;

  @override
  State<StoryRecommendForm> createState() => _StoryRecommendFormState();
}

class _StoryRecommendFormState extends State<StoryRecommendForm> {
  int _pageIndex = 0; // 현재 페이지 인덱스
  int _bookCurrent = 0; // 책 인덱스

  // 책 컨트롤러
  final CarouselController _carouselController = CarouselController();

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Column(
        children: [
          Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomCategoryButton(
                      label: "로맨스/BL",
                      index: 0,
                      pageIndex: _pageIndex,
                      onPress: () {
                        changePage(0);
                      }),
                  CustomCategoryButton(
                      label: "판타지/무협",
                      index: 1,
                      pageIndex: _pageIndex,
                      onPress: () {
                        changePage(1);
                      }),
                  CustomCategoryButton(
                      label: "일반소설",
                      index: 2,
                      pageIndex: _pageIndex,
                      onPress: () {
                        changePage(2);
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: kBackLightGray,
              child: IndexedStack(
                index: _pageIndex,
                children: [
                  StoryCategorySlider(
                    storyCategoryId: 1,
                    current: _bookCurrent,
                    imageController: _carouselController,
                    funPageChanged: (index, reason) {
                      setState(() {
                        _bookCurrent = index;
                      });
                    },
                  ),
                  StoryCategorySlider(
                    storyCategoryId: 2,
                    current: _bookCurrent,
                    imageController: _carouselController,
                    funPageChanged: (index, reason) {
                      setState(() {
                        _bookCurrent = index;
                      });
                    },
                  ),
                  StoryCategorySlider(
                    storyCategoryId: 3,
                    current: _bookCurrent,
                    imageController: _carouselController,
                    funPageChanged: (index, reason) {
                      setState(() {
                        _bookCurrent = index;
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
