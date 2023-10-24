import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/now_book_list_page/now_book_list_page.dart';

class Move {
  // TODO : 서버 측 엔드포인트 확인
  // 예시
  static String NowBookListPage = "/nowBooks";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // 예시
    Move.NowBookListPage: (context) => const NowBookListPage(),
  };
}
