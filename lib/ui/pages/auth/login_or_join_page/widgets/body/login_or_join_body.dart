import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/join_id_email_page/join_id_email_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_join_page/widgets/login_or_join_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_radius_color_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_text_and_text_button.dart';

class LoginOrJoinBody extends StatelessWidget {
  const LoginOrJoinBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
              child: Image.asset("assets/logos/millie_logo_yellow.png",
                  height: 50)),
          LoginOrJoinForm(),
        ],
      ),
    );
  }
}
