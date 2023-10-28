import 'package:flutter_blog/data/model/book_like.dart';

/// Future.delayed 응답 데이터

class DelayedResponse {
  Future<List<BookLike>> fetchBookLikeWrite() {
    return Future.delayed(Duration(seconds: 3), () => bookLikes);
  }
}
