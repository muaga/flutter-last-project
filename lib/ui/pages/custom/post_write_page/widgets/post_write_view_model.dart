import 'package:flutter_blog/data/dto/request_dto/post_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class PostWriteModel {
  final int boardId;
  final String boardTitle;
  final String content;
  final int? bookId;
  final int userId;

  PostWriteModel({
    required this.boardId,
    required this.boardTitle,
    required this.content,
    this.bookId,
    required this.userId,
  });

  factory PostWriteModel.fromJson(Map<String, dynamic> json) {
    return PostWriteModel(
      boardId: json["boardId"],
      boardTitle: json["boardTitle"],
      content: json["content"],
      bookId: json["bookId"],
      userId: json["userId"],
    );
  }
}

// 창고
class PostWriteViewModel extends StateNotifier<PostWriteModel?> {
  PostWriteViewModel(super._state, this.ref);

  Ref ref;

  Future<void> savePost(PostSaveReqDTO postSaveReqDTO) async {
    SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO =
        await PostRepository().fetchSavePost(sessionUser.jwt!, postSaveReqDTO);
    PostWriteModel model = responseDTO.data;
    state = PostWriteModel(
        boardId: model.boardId,
        boardTitle: model.boardTitle,
        content: model.content,
        userId: model.userId);
  }
}

// 창고 관리자
final postWriteProvider =
    StateNotifierProvider<PostWriteViewModel, PostWriteModel?>((ref) {
  return PostWriteViewModel(null, ref);
});
