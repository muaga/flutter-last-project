import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_sign_page/login_or_sign_page.dart';
import 'package:flutter_blog/ui/pages/auth/millie_splash_page/widgets/millie_splash_body.dart';

class MainSplashPage extends StatefulWidget {
  const MainSplashPage({super.key});

  @override
  State<MainSplashPage> createState() => _MainSplashPageState();
}

class _MainSplashPageState extends State<MainSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginOrSignPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: MainSplashBody(),
    );
  }
}
