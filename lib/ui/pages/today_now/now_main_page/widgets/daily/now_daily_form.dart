import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class NowDailyForm extends StatelessWidget {
  const NowDailyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: getScreenWidth(context) * 1.1,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/lemon.jpg"),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.srcATop,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("삶이란,", style: subTitle1()),
            SizedBox(height: gapXlarge),
            Container(
              height: getScreenWidth(context) * 0.65,
              width: getScreenWidth(context) * 0.55,
              decoration: BoxDecoration(
                color: kBackWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: kFontLightGray, // 그림자의 색상
                    offset: Offset(1, 1), // 그림자의 위치 (x, y)
                    blurRadius: 8.0, // 그림자의 흐림 정도
                    spreadRadius: 2.0, // 그림자의 확산 정도
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(gapLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/sign2.png"),
                        color: kFontGray,
                        height: 15,
                      ),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                      child: Text(
                        "나는 좀 싱겁게 웃었다.\n 나무를 심는다고\n 정착이 되는 건\n아니었구나.",
                        style: subTitle2(mFontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/sign1.png"),
                        color: kFontGray,
                        height: 15,
                      ),
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: gapLarge),
            Text("노재희, <나무와 함께 정처 없음>")
          ],
        ),
      ),
    );
  }
}
