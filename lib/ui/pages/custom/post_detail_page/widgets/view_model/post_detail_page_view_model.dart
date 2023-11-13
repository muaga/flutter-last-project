// 창고 데이터
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailModel {
  late int boardId;
  late int boardLikeCount;
  late int boardReplCount;
  late String boardTitle;
  late String boardUserPicUrl;
  late String boardUserNickname;
  late String boardCreatedAt;
  late String boardContent;
  late int bookId;
  late String bookPicUrl;
  late String bookTitle;
  late String bookWriter;
  late int boardReplyCount;
  late List<BoardReplyDto> boardReplyDtOs;

  PostDetailModel({
    required this.boardId,
    required this.boardLikeCount,
    required this.boardReplCount,
    required this.boardTitle,
    required this.boardUserPicUrl,
    required this.boardUserNickname,
    required this.boardCreatedAt,
    required this.boardContent,
    required this.bookId,
    required this.bookPicUrl,
    required this.bookTitle,
    required this.bookWriter,
    required this.boardReplyCount,
    required this.boardReplyDtOs,
  });

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      PostDetailModel(
        boardId: json["boardId"],
        boardLikeCount: json["boardLikeCount"],
        boardReplCount: json["boardReplCount"],
        boardTitle: json["boardTitle"],
        boardUserPicUrl: json["boardUserPicUrl"],
        boardUserNickname: json["boardUserNickname"],
        boardCreatedAt: json["boardCreatedAt"],
        boardContent: json["boardContent"],
        bookId: json["bookId"],
        bookPicUrl: json["bookPicUrl"],
        bookTitle: json["bookTitle"],
        bookWriter: json["bookWriter"],
        boardReplyCount: json["boardReplyCount"],
        boardReplyDtOs: List<BoardReplyDto>.from(
            json["boardReplyDTOs"].map((x) => BoardReplyDto.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "boardId": boardId,
  //   "boardLikeCount": boardLikeCount,
  //   "boardReplCount": boardReplCount,
  //   "boardTitle": boardTitle,
  //   "boardUserPicUrl": boardUserPicUrl,
  //       "boardUserNickname": boardUserNickname,
  //       "boardCreatedAt": boardCreatedAt,
  //       "boardContent": boardContent,
  //       "bookId": bookId,
  //       "bookPicUrl": bookPicUrl,
  //       "bookTitle": bookTitle,
  //       "bookWriter": bookWriter,
  //       "boardReplyCount": boardReplyCount,
  //       "boardReplyDTOs":
  //           List<dynamic>.from(boardReplyDtOs.map((x) => x.toJson())),
  //     };
}

class BoardReplyDto {
  final String replyUserPicUrl;
  final String replyUserNickname;
  final String replyCreatedAt;
  final String replyContent;

  BoardReplyDto({
    required this.replyUserPicUrl,
    required this.replyUserNickname,
    required this.replyCreatedAt,
    required this.replyContent,
  });

  BoardReplyDto.fromJson(Map<String, dynamic> json)
      : replyUserPicUrl = json["replyUserPicUrl"],
        replyUserNickname = json["replyUserNickname"],
        replyCreatedAt = json["replyCreatedAt"],
        replyContent = json["replyContent"];

  // Map<String, dynamic> toJson() => {
  //       "replyUserPicUrl": replyUserPicUrl,
  //       "replyUserNickname": replyUserNickname,
  //       "replyCreatedAt":
  //           "${replyCreatedAt.year.toString().padLeft(4, '0')}-${replyCreatedAt.month.toString().padLeft(2, '0')}-${replyCreatedAt.day.toString().padLeft(2, '0')}",
  //       "replyContent": replyContent,
  //     };
}

// 창고
class PostDetailViewModel extends StateNotifier<PostDetailModel?> {
  PostDetailViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit(int boardId) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO =
        await PostRepository().fetchPost(sessionUser.jwt!, boardId);

    PostDetailModel? model = responseDTO.data;
    Logger().d("data : ${responseDTO.data}");

    state = PostDetailModel(
        boardId: model!.boardId,
        boardLikeCount: model.boardLikeCount,
        boardReplCount: model.boardReplCount,
        boardTitle: model.boardTitle,
        boardUserPicUrl: model.boardUserPicUrl,
        boardUserNickname: model.boardUserPicUrl,
        boardCreatedAt: model.boardCreatedAt,
        boardContent: model.boardContent,
        bookId: model.bookId,
        bookPicUrl: model.bookPicUrl,
        bookTitle: model.bookTitle,
        bookWriter: model.bookWriter,
        boardReplyCount: model.boardReplyCount,
        boardReplyDtOs: model.boardReplyDtOs);
  }
}

// 창고 관리자
final postDetailProvider =
    StateNotifierProvider.family<PostDetailViewModel, PostDetailModel?, int>(
        (ref, boardId) {
  return PostDetailViewModel(null, ref)..notifyInit(boardId);
});
