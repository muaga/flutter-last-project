import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/join_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_or_join_page/login_or_join_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';
import 'package:flutter_blog/ui/pages/auth/millie_splash_page/millie_splash_page.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/post_write_page.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/my_library_main_page.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/my_setting_main_page.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/search_main_page.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/one_month_press_book_list_page.dart';

import '../../ui/pages/today_now/book_store_best_book_list_page/book_store_best_book_list_page.dart';

class Move {
  // TODO : 서버 측 엔드포인트 확인 -> 변경하기

  // auth
  static String MainSplashPage = "/mainSplash";
  static String LoginOrJoinPage = "/loginJoin";
  static String JoinPage = "/join";
  static String LoginPage = "/login";

  // search
  static String SearchMainPage = "/searchMain";

  // custom
  static String BookDetailPage = "/book/Detail";
  static String PostDetailPage = "/post/Detail";
  static String PostWritePage = "/post/Write";

  // today-now
  static String BookStoreBestBookListPage = "/bookStoreBestList";
  static String OneMonthPressBookListPage = "/oneMonthPressBookList";
  // feed

  // myLibrary
  static String MyLibraryMainPage = "/myLibraryMain";

  // mySetting
  static String MySettingMainPage = "/mySettingMain";

  // serch

  // today-now
  static String NowBookListPage = "/nowBooks";

  // today-story

  /// 테스트
  static String ReplyWriteAndListPage = "/reply";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // auth
    Move.MainSplashPage: (context) => const MainSplashPage(),
    Move.LoginOrJoinPage: (context) => const LoginOrJoinPage(),
    Move.JoinPage: (context) => const JoinPage(),
    Move.LoginPage: (context) => const LoginPage(),

    // search
    Move.SearchMainPage: (context) => const SearchMainPage(),

    // custom
    Move.BookDetailPage: (context) {
      final bookId = ModalRoute.of(context)!.settings.arguments as int;
      // 현재 경로에서 전달되는 인수
      return BookDetailPage(bookId: bookId);
    },
    Move.PostDetailPage: (context) {
      final postId = ModalRoute.of(context)!.settings.arguments as int;
      return PostDetailPage(postId: 1);
    },
    Move.PostWritePage: (context) => PostWritePage(),

    // today-now
    // 한달 이내에 출간한 책 목록 페이지
    Move.BookStoreBestBookListPage: (context) =>
        const BookStoreBestBookListPage(),
    // 지금 서점 베스트 책 목록 페이지
    Move.OneMonthPressBookListPage: (context) =>
        const OneMonthPressBookListPage(),

    // my-settiing
    Move.MySettingMainPage: (context) => const MySettingMainPage(),
    Move.ReplyWriteAndListPage: (context) => ReplyWriteAndListPage(),

    // my-library
    Move.MyLibraryMainPage: (context) => MyLibraryMainPage()
  };
}

/// 인수로 전달해야하는 페이지일 때
// Move.BookDetailPage: (context) {
//   final bookId = ModalRoute.of(context)!.settings.arguments as int;
//   // 현재 경로에서 전달되는 인수
//   return BookDetailPage(bookId: bookId);
// },
