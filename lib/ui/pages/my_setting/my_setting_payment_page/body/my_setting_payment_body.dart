import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/custom_title_and_subtitle_form.dart';
import 'package:flutter_gif/flutter_gif.dart';

class MySettingPaymentBody extends StatefulWidget {
  const MySettingPaymentBody({super.key});

  @override
  State<MySettingPaymentBody> createState() => _MySettingPaymentBodyState();
}

class _MySettingPaymentBodyState extends State<MySettingPaymentBody>
    with TickerProviderStateMixin {
  late FlutterGifController controller;

  @override
  void initState() {
    controller = FlutterGifController(vsync: this);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.repeat(
        min: 0,
        max: 53,
        period: const Duration(milliseconds: 3500),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            CustomTitleAndSubtitleForm(
                title: "언제든 해지 가능",
                subTitle: "일단 다시 시작하세요",
                subTitleStyle: title1()),
          ],
        ),
        Image(
            image: AssetImage("assets/images/subScriptionImage.gif"),
            width: 10,
            height: 10),
      ],
    );
  }
}
