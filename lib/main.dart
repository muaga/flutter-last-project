import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/theme.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_join_page/login_or_join_page.dart';
import 'package:flutter_blog/ui/pages/auth/millie_splash_page/millie_splash_page.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MainSplashPage(),
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: LoginOrJoinPage(),
      routes: getRouters(),
    );
  }
}
