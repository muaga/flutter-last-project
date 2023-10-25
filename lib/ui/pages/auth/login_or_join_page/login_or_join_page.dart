import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_join_page/widgets/body/login_or_sign_body.dart';

class LoginOrJoinPage extends StatelessWidget {
  const LoginOrJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LoginOrJoinBody(),
      ),
    );
  }
}
