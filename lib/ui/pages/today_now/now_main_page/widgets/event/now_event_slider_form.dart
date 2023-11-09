import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/reponse_dto/event_response_dto_test.dart';
import 'package:flutter_blog/ui/pages/today_now/web_page/web_view_page.dart';

class EventSliderForm extends StatelessWidget {
  EventSliderForm({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewPage(url: event.url)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: gapSmall),
        child: Container(
          width: getScreenWidth(context) * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: event.backColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(gapMain),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.title,
                      style: subTitle2(mColor: kFontWhite),
                    ),
                    const SizedBox(height: gapSmall),
                    Text(
                      event.content,
                      style: body4(
                          mColor: kFontWhite, mFontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: gapMain),
                child: Image(
                  image: AssetImage("assets/images/${event.picUrl}"),
                  height: getScreenWidth(context) * 0.33,
                  width: getScreenWidth(context) * 0.18,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
