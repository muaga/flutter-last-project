import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/recommend/story_category_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';

class StoryCategorySlider extends StatelessWidget {
  const StoryCategorySlider(
      {Key? key,
      required this.storyCategoryId,
      required this.imageController,
      required this.current,
      required this.funPageChanged,
      required this.bookList});

  final int storyCategoryId;
  final CarouselController imageController;
  final int current;
  final funPageChanged;
  final List<StoryBookDTO> bookList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CarouselSlider(
        carouselController: imageController,
        items: bookList.map(
          (book) {
            return Builder(
              builder: (context) {
                return StoryCategorySliderForm(book: book);
              },
            );
          },
        ).toList(),
        options: CarouselOptions(
          viewportFraction: 0.4,
          aspectRatio: 0.5,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.5,
        ),
      ),
    );
  }
}
