// 창고
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedMainModel {}

class FeedMainViewModel extends StateNotifier<FeedMainModel?> {
  FeedMainViewModel(super._state);

  void notifyInit() async {
    ResponseDTO responseDTO = await PostRepository.fetchPostList();
    state = FeedMainModel();
  }
}

final feedMainProvider =
    StateNotifierProvider<FeedMainViewModel, FeedMainModel?>((ref) {
  return FeedMainViewModel(null)..notifyInit();
});
