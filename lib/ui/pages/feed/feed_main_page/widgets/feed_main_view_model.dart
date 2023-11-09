// 창고
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedMainModel {
  final List<BoardDTO> boardList;

  FeedMainModel({required this.boardList});

  // factory FeedMainModel.fromJson(Map<String, dynamic> json) {
  //   List<dynamic> temp = json["boardList"];
  //   List<BoardDTO> boardList = temp.map((e) => BoardDTO.fromJson(e)).toList();
  //
  //   return FeedMainModel(boardList: boardList);
  // }
}

class BoardDTO {
  final int id;
  final String boardTitle;
  final String content;
  final String userPicUrl;
  final String userNickname;
  final String boardCreatedAt;

  BoardDTO(
      {required this.id,
      required this.boardTitle,
      required this.content,
      required this.userPicUrl,
      required this.userNickname,
      required this.boardCreatedAt});
}

class FeedMainViewModel extends StateNotifier<FeedMainModel?> {
  FeedMainViewModel(super._state);

  void notifyInit() async {
    // ResponseDTO responseDTO = await PostRepository.fetchPostList();
    // state = FeedMainModel();
  }
}

final feedMainProvider =
    StateNotifierProvider<FeedMainViewModel, FeedMainModel?>((ref) {
  return FeedMainViewModel(null)..notifyInit();
});
