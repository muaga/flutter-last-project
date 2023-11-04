import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class NowTextSliderForm extends StatelessWidget {
  NowTextSliderForm(
      {super.key,
      required this.textController,
      required this.textList,
      required this.current,
      required this.funPageChanged});

  final CarouselController textController;
  final List<String> textList;
  int current;
  final funPageChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      // 해당 위젯의 위치를 조절하려고 stack-positioned를 썼으나,
      // CustomScrollWidget은 계속 width때문에 오류가 났다.
      // 해결방법은 해당 위젯에 직접 위치를 주는 것
      child: CarouselSlider(
        carouselController: textController,
        items: textList.map(
          (text) {
            return Builder(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.01),
                        Colors.black.withOpacity(0.5)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: gapMain),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("HOT", style: body3()),
                          decoration: BoxDecoration(
                              color: kBackWhite,
                              borderRadius: BorderRadius.circular(30)),
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                        ),
                        SizedBox(height: gapSmall),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            text,
                            style: subTitle1(mColor: kFontWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
        options: CarouselOptions(
            height: 90,
            viewportFraction: 1.0,
            autoPlay: true,
            scrollPhysics: NeverScrollableScrollPhysics(),
            // 슬라이드 비활성화
            autoPlayAnimationDuration: Duration(seconds: 2),
            autoPlayInterval: const Duration(seconds: 6),
            enlargeCenterPage: false,
            onPageChanged: funPageChanged),
      ),
    );
  }
}
