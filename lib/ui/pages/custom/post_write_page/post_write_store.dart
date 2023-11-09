import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class PostWriteModel {
  final String? title;
  final String? content;
  final int? bookId;

  PostWriteModel({
    this.title,
    this.content,
    this.bookId,
  });
}

// 창고
class PostWriteStore extends PostWriteModel {
  final mContext = navigatorKey.currentContext;
}

// 창고 관리자
final postWriteProvider = Provider((ref) {
  return PostWriteStore();
});
