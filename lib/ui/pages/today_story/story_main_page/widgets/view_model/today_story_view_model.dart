import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 데이터
class TodayStoryModel {
  int storyCategoryId;
  List<StoryBookDTO> storyBookList;

  TodayStoryModel({required this.storyCategoryId, required this.storyBookList});

  factory TodayStoryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["storyBookList"];
    List<StoryBookDTO> storyBookList =
        temp.map((e) => StoryBookDTO.fromJson(e)).toList();

    return TodayStoryModel(
        storyCategoryId: json["storyCategoryId"], storyBookList: storyBookList);
  }
}

class StoryBookDTO {
  final int bookId;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  StoryBookDTO(
      {required this.bookId,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

  StoryBookDTO.fromJson(Map<String, dynamic> json)
      : bookId = json["bookId"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

/// 2. 창고
class TodayStoryViewModel extends StateNotifier<TodayStoryModel?> {
  TodayStoryViewModel(super._state, this.ref);

  Ref ref;

  Future<TodayStoryModel> notifyInit(int categoryId) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchStoryBookList(categoryId);
    TodayStoryModel model = responseDTO.data;
    state = TodayStoryModel(
        storyCategoryId: model.storyCategoryId,
        storyBookList: model.storyBookList);

    return TodayStoryModel(
        storyCategoryId: model.storyCategoryId,
        storyBookList: model.storyBookList);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final todayStoryProvider =
    StateNotifierProvider.family<TodayStoryViewModel, TodayStoryModel?, int>(
        (ref, categoryId) {
  return TodayStoryViewModel(null, ref)..notifyInit(categoryId);
});
