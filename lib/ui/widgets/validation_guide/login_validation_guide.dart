import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';

class LoginValidationImage extends StatelessWidget {
  const LoginValidationImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double loginValidationImageWidth = getScreenWidth(context) * 0.8;
    return Column(
      children: [
        Image(
            image: AssetImage("assets/images/login_validation.png"),
            width: loginValidationImageWidth),
        Text("리뷰 작성은 로그인 후 가능합니다.", style: subTitle2()),
        SizedBox(height: gapLarge),
        CustomRadiusColorButton(
          buttonText: "로그인",
          funPageRoute: () {
            Navigator.pushNamed(context, Move.LoginPage);
          },
          buttonWidth: loginValidationImageWidth,
        ),
        SizedBox(height: gapLarge),
      ],
    );
  }
}
