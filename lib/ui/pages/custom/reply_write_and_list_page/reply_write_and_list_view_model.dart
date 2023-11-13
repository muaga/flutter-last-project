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
  final int? bookReplyCount;
  List<ReplyDTO> replyDTOs;
  BookReplyListModel({required this.bookReplyCount, required this.replyDTOs});

  BookReplyListModel.fromJson(Map<String, dynamic> json)
      : bookReplyCount = json["bookReplyConut"],
        replyDTOs = (json["replyDTOs"] as List)
            .map((e) => ReplyDTO.fromJson(e))
            .toList();
}

class ReplyDTO {
  final int? id;
  final String userPicUrl;
  final String nickname;
  final String replyCreatedAt;
  final String replyContent;

  ReplyDTO(
      {required this.id,
      required this.userPicUrl,
      required this.nickname,
      required this.replyCreatedAt,
      required this.replyContent});

  ReplyDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userPicUrl = json["userPicUrl"],
        nickname = json["nickname"],
        replyCreatedAt = json["replyCreatedAt"],
        replyContent = json["replyContent"];
}

class SaveReplyDTO {
  final int bookReplyId;
  final int userId;
  final int bookId;
  final String userPicUrl;
  final String username;
  final String bookReplyContent;
  final String bookReplyCreatedAt;

  SaveReplyDTO(
      {required this.bookReplyId,
      required this.userId,
      required this.bookId,
      required this.userPicUrl,
      required this.username,
      required this.bookReplyContent,
      required this.bookReplyCreatedAt});

  SaveReplyDTO.fromJson(Map<String, dynamic> json)
      : bookReplyId = json["bookReplyId"],
        userId = json["userId"],
        bookId = json["bookId"],
        userPicUrl = json["userPicUrl"],
        username = json["nickname"],
        bookReplyContent = json["bookReplyContent"],
        bookReplyCreatedAt = json["bookReplyCreatedAt"];
}

// 2. 창고
class BookReplyListViewModel extends StateNotifier<BookReplyListModel?> {
  Ref ref;
  BookReplyListViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit(int bookId) async {
    // jwt 가져오기
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO = await BookReplyRepository()
        .fetchBookReplyList(sessionUser.jwt!, bookId);

    state = responseDTO.data;
  }

  Future<void> notifyAdd(BookReplyWriteReqDTO dto) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO =
        await BookReplyRepository().fetchBookReplyWrite(sessionUser.jwt!, dto);

    if (responseDTO.code == 1) {
      SaveReplyDTO saveReplyDTO = responseDTO.data;
      ReplyDTO newReply = new ReplyDTO(
          id: saveReplyDTO.bookReplyId,
          userPicUrl: saveReplyDTO.userPicUrl,
          nickname: saveReplyDTO.username,
          replyCreatedAt: saveReplyDTO.bookReplyCreatedAt,
          replyContent: saveReplyDTO.bookReplyContent);
      List<ReplyDTO> newBookReplys = [...state!.replyDTOs, newReply];
      BookReplyListModel model = state!; // 2. 기존 상태에 데이터 추가 [전개연산자]
      state = BookReplyListModel(
          bookReplyCount: model.bookReplyCount,
          replyDTOs:
              newBookReplys); // 3. 뷰모델(창고) 데이터 갱신이 완료 -> watch 구독자는 rebuild됨.
      // 4. 글쓰기 화면 pop
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
    }
  }
}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final bookReplyListProvider = StateNotifierProvider.family
    .autoDispose<BookReplyListViewModel, BookReplyListModel?, int>(
        (ref, bookId) {
  return BookReplyListViewModel(null, ref)..notifyInit(bookId);
});
