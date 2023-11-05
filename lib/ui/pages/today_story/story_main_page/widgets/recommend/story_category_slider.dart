import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';

class StoryCategorySlider extends StatelessWidget {
  const StoryCategorySlider({
    Key? key,
    required this.storyCategoryId,
    required this.imageController,
    required this.current,
    required this.funPageChanged,
  });

  final int storyCategoryId;
  final CarouselController imageController;
  final int current;
  final funPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CarouselSlider(
        carouselController: imageController,
        items: books.map(
          (book) {
            return Builder(
              builder: (context) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image(
                          image: CachedNetworkImageProvider(
                            "http://172.30.56.249:8080/images/${book.picUrl}",
                          ),
                          height: getScreenWidth(context) * 0.5,
                        ),
                      ),
                      Text("${book.title}"),
                      Text("${book.writer}")
                    ],
                  ),
                );
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
