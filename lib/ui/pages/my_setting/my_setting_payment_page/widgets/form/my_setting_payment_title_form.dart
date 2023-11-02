import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/custom_title_and_subtitle_form.dart';

class MySettingPaymentTitleForm extends StatelessWidget {
  const MySettingPaymentTitleForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 25),
              child: CustomTitleAndSubtitleForm(
                  title: "언제든 해지 가능",
                  subTitle: "일단 다시 시작하세요",
                  subTitleStyle: title1()),
            ),
          ],
        ),
        Positioned(
          right: 15,
          top: -25,
          child: Image(
            image: AssetImage("assets/images/sub_book.png"),
            width: 150,
          ),
        ),
      ],
    );
  }
}
