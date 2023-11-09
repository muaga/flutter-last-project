import 'package:flutter_blog/data/dto/request_dto/post_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class PostUpdateModel {
  final int boardId;
  final String boardTitle;
  final String content;
  final int? bookId;
  final int userId;

  PostUpdateModel({
    required this.boardId,
    required this.boardTitle,
    required this.content,
    this.bookId,
    required this.userId,
  });

  factory PostUpdateModel.fromJson(Map<String, dynamic> json) {
    return PostUpdateModel(
      boardId: json["boardId"],
      boardTitle: json["boardTitle"],
      content: json["content"],
      bookId: json["bookId"],
      userId: json["userId"],
    );
  }
}

// 창고
class PostUpdateViewModel extends StateNotifier<PostUpdateModel?> {
  PostUpdateViewModel(super._state, this.ref);

  Ref ref;

  Future<void> updatePost(PostUpdateReqDTO postUpdateReqDTO) async {
    SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO = await PostRepository()
        .fetchUpdatePost(sessionUser.jwt!, postUpdateReqDTO);
    PostUpdateModel model = responseDTO.data;
    state = PostUpdateModel(
        boardId: model.boardId,
        boardTitle: model.boardTitle,
        content: model.content,
        userId: model.userId);
  }
}

// 창고 관리자
final postUpdateProvider =
    StateNotifierProvider<PostUpdateViewModel, PostUpdateModel?>((ref) {
  return PostUpdateViewModel(null, ref);
});
