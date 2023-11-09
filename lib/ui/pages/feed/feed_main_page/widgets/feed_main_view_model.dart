// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedMainModel {}

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
