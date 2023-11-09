import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/event/now_event_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/reponse_dto/event_response_dto_test.dart';

class NowEventSlider extends StatelessWidget {
  NowEventSlider(
      {super.key,
      required this.controller,
      required this.events,
      required this.funPageChanged});

  final CarouselController controller;
  List<Event> events;
  final funPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      items: events.map((event) {
        return Builder(
          builder: (context) {
            return EventSliderForm(event: event);
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 120,
        viewportFraction: 1.0,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(seconds: 2),
        onPageChanged: funPageChanged,
      ),
    );
  }
}
