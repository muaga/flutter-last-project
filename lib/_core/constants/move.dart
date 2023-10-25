import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_id_email_page/join_id_email_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_sign_page/login_or_sign_page.dart';
import 'package:flutter_blog/ui/pages/auth/millie_splash_page/millie_splash_page.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/post_write_page.dart';
import 'package:flutter_blog/ui/pages/today_now/now_book_list_page/now_book_list_page.dart';

class Move {
  // TODO : 서버 측 엔드포인트 확인 -> 변경하기

  static String NowBookListPage = "/nowBooks";
  static String BookDetailPage = "/bookDetail";
  static String PostDetailPage = "/postDetail";
  static String PostWritePage = "/postWrite";
  static String JoinIdEmailPage = "/joinIdEmail";
  static String MainSplashPage = "/mainSplash";
  static String LoginOrSignPage = "/loginJoin";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // 예시
    Move.NowBookListPage: (context) => const NowBookListPage(),
    Move.BookDetailPage: (context) => const BookDetailPage(bookId: 1),
    Move.PostDetailPage: (context) => const PostDetailPage(postId: 1),
    Move.PostWritePage: (context) => PostWritePage(),
    Move.JoinIdEmailPage: (context) => const JoinIdEmailPage(),
    Move.MainSplashPage: (context) => const MainSplashPage(),
    Move.LoginOrSignPage: (context) => const LoginOrSignPage(),
  };
}
