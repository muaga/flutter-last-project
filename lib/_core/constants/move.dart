import 'package:flutter/material.dart';

class Move {
  // TODO : 서버 측 엔드포인트 확인
  // 예시
  static String bookListPage = "/books";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // 예시
    // Move.bookListPage: (context) => const BookListPage(),
  };
}
