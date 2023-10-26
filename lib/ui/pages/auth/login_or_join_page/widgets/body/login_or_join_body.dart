import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_join_page/widgets/login_or_join_form.dart';

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
