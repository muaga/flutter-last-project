// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_reply_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/data/repository/book_reply_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReplyListModel {
  List<BookReply> bookReplys;
  BookReplyListModel(this.bookReplys);
}

// 2. 창고
class BookReplyListViewModel extends StateNotifier<BookReplyListModel?> {
  BookReplyListViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    // jwt 가져오기
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO =
        await BookReplyRepository().fetchBookReplyList(sessionUser.jwt!);
    state = BookReplyListModel(responseDTO.data);
  }

  Future<void> notifyAdd(BookReplyWriteReqDTO dto) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO =
        await BookReplyRepository().fetchBookReplyWrite(sessionUser.jwt!, dto);

    if (responseDTO.code == 1) {
      BookReply newBookReply =
          responseDTO.data as BookReply; // 1. dynamic(Post) -> 다운캐스팅
      List<BookReply> newBookReplys = [
        newBookReply,
        ...state!.bookReplys
      ]; // 2. 기존 상태에 데이터 추가 [전개연산자]
      state = BookReplyListModel(
          newBookReplys); // 3. 뷰모델(창고) 데이터 갱신이 완료 -> watch 구독자는 rebuild됨.
      Navigator.pop(mContext!); // 4. 글쓰기 화면 pop
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
    }
  }
}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final bookReplyListProvider = StateNotifierProvider.autoDispose<
    BookReplyListViewModel, BookReplyListModel?>((ref) {
  return BookReplyListViewModel(null, ref)..notifyInit();
});
