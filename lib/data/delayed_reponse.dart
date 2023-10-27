import 'package:flutter_blog/data/model/book_like.dart';

/// Future.delayed 응답 데이터

class DelayedResponse {
  Future<BookLike> fetchBookLikeWrite() {
    return Future.delayed(Duration(seconds: 3), () => bookLike);
  }
}
