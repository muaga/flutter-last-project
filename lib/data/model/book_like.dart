import 'package:flutter_blog/data/model/user.dart';

import 'book.dart';

// TODO : bookLike가 생기면 나오게 하기
class BookLike {
  final int id;
  final int userId;
  final int bookId;
  String createdAt;

  BookLike(
      {required this.id,
      required this.userId,
      required this.bookId,
      required this.createdAt});
}

// 북 좋아요 유무 -> 1번 있음 2번 없음

// mock 데이터
BookLike bookLike =
    BookLike(id: 1, userId: 1, bookId: 1, createdAt: "2022-10-10");
