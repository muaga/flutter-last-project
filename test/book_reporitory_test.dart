import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';
import 'package:logger/logger.dart';
// void main() async {}
// import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view_model/one_month_press_book_list_view_model.dart';

void main() async {
  await fetchStoryBookList(1);
}

/// TODO : 통신 테스트

// 스토리 카테고리별 책 목록
Future<void> fetchStoryBookList(int categoryId) async {
  // 통신
  Response<dynamic> response =
      await dio.get("/book/storyCategory/${categoryId}");
  // Logger().d("결과 : ${response.data}");
  // 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

  TodayStoryModel model = TodayStoryModel.fromJson(responseDTO.data);
  Logger().d("결과 : ${model.storyBookList}");
  Logger().d("결과 : ${model.storyBookList.length}");
  // responseDTO.data = model;
}
