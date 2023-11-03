import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderForm extends StatefulWidget {
  ImageSliderForm(
      {super.key,
      required this.imageController,
      required this.imageList,
      required this.current});

  final CarouselController imageController;
  final List<String> imageList;
  int current;

  @override
  State<ImageSliderForm> createState() => _ImageSliderFormState();
}

class _ImageSliderFormState extends State<ImageSliderForm> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.imageController,
      items: widget.imageList.map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    "assets/story_banners/${imgLink}",
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        // 자동 슬라이드
        viewportFraction: 1.0,
        // view 비율, 0.5일 때 반만 나오고 양쪽으로 이전 item과 이후 item이 보임
        enlargeCenterPage: false,
        // 1.0에 false하면 item이 붙어 나온다.
        autoPlayAnimationDuration: Duration(seconds: 2),
        // 슬라이더 넘어가는 속도
        autoPlayInterval: const Duration(seconds: 6),
        // 슬라이더 대기 시간
        onPageChanged: (index, reason) {
          setState(() {
            widget.current = index;
          });
        },
      ),
    );
  }
}
