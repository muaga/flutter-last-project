import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/millie_IndexStack_navigation_bar.dart';
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
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_choice_page/my_setting_resignation_choice_page.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/my_setting_resignation_page.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_profile_page/my_setting_profile_page.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/search_main_page.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/search_result_page.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/one_month_press_book_list_page.dart';

import '../../ui/pages/today_now/book_store_best_book_list_page/book_store_best_book_list_page.dart';

class Move {
  // TODO : 서버 측 엔드포인트 확인 -> 변경하기

  /// auth
  static String MainSplashPage = "/mainSplash";
  static String LoginOrJoinPage = "/loginJoin";
  static String JoinPage = "/join";
  static String LoginPage = "/login";

  /// search
  static String SearchMainPage = "/searchMain";
  static String SearchResultPage = "/searchResult";

  /// custom
  static String BookDetailPage = "/book/Detail";
  static String PostDetailPage = "/post/Detail";
  static String PostWritePage = "/post/Write";
  static String ReplyWriteAndListPage = "/replyWriteAndList";

  /// today-now
  static String BookStoreBestBookListPage = "/bookStoreBestList";
  static String OneMonthPressBookListPage = "/oneMonthPressBookList";

  /// today-story

  /// feed

  /// myLibrary
  static String MyLibraryMainPage = "/myLibraryMain";

  /// mySetting
  static String MySettingMainPage = "/mySettingMain";
  static String MySettingResignationPage = "/mySettingResignation";
  static String MySettingResignationChoicePage = "/mySettingResignationChoice";
  static String MySettingProfilePage = "/mySettingProfile";

  /// bottom
  static String MillieIndexStackNavigationBar = "/indexStack";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    /// bottom
    Move.MillieIndexStackNavigationBar: (context) =>
        const MillieIndexStackNavigationBar(),

    /// auth
    Move.MainSplashPage: (context) => const MainSplashPage(),
    Move.LoginOrJoinPage: (context) => const LoginOrJoinPage(),
    Move.JoinPage: (context) => const JoinPage(),
    Move.LoginPage: (context) => const LoginPage(),

    /// search
    Move.SearchMainPage: (context) => const SearchMainPage(),
    Move.SearchResultPage: (context) {
      final searchText = ModalRoute.of(context)!.settings.arguments as String;
      return SearchResultPage(searchText: searchText);
    },

    /// custom
    Move.BookDetailPage: (context) {
      final bookId = ModalRoute.of(context)!.settings.arguments as int;
      // 현재 경로에서 전달되는 인수
      return BookDetailPage(bookId: bookId);
    },
    Move.PostDetailPage: (context) {
      final postId = ModalRoute.of(context)!.settings.arguments as int;
      // TODO 은혜 : 포스트상세페이지 완료시 번호->postId
      return PostDetailPage(postId: 1);
    },
    Move.PostWritePage: (context) => PostWritePage(),
    Move.ReplyWriteAndListPage: (context) => ReplyWriteAndListPage(),

    /// today-now
    // 한달 이내에 출간한 책 목록 페이지
    Move.BookStoreBestBookListPage: (context) =>
        const BookStoreBestBookListPage(),
    // 지금 서점 베스트 책 목록 페이지
    Move.OneMonthPressBookListPage: (context) =>
        const OneMonthPressBookListPage(),

    /// my-settiing
    Move.MySettingMainPage: (context) => const MySettingMainPage(),
    Move.MySettingResignationPage: (context) => MySettingResignationPage(),
    Move.MySettingResignationChoicePage: (context) {
      final userId = ModalRoute.of(context)!.settings.arguments as int;
      // 현재 경로에서 전달되는 인수
      // TODO 은혜 : 번호->postId
      return MySettingResignationChoicePage(userId: 1);
    },
    Move.MySettingProfilePage: (context) => const MySettingProfilePage(),

    /// my-library
    Move.MyLibraryMainPage: (context) => const MyLibraryMainPage()
  };
}

/// 인수로 전달해야하는 페이지일 때
// Move.BookDetailPage: (context) {
//   final bookId = ModalRoute.of(context)!.settings.arguments as int;
//   // 현재 경로에서 전달되는 인수
//   return BookDetailPage(bookId: bookId);
// },
