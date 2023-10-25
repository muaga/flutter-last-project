import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';

class LoginOrSignBody extends StatelessWidget {
  const LoginOrSignBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 65, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: gapLarge),
            Center(
                child: Image.asset("assets/logos/millie_logo_yellow.png",
                    height: 50)),
          ]),
          Column(children: [
            CustomRadiusColorButton(
                buttonText: "첫 달 무료로 시작하기", routerLoad: "/joinIdEmail"),
            SizedBox(height: gapXlarge),
          ]),
        ],
      ),
    );
  }
}
