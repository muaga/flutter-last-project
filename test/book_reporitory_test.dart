import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
<<<<<<< HEAD
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';
=======
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_main_view_model.dart';
>>>>>>> dev
import 'package:logger/logger.dart';
// void main() async {}
// import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view_model/one_month_press_book_list_view_model.dart';

void main() async {
  await fetchStoryBookList(1);
}

/// TODO : 통신 테스트
// Future<void> fetch(BookRequestDTO dto) async {
//   Response<dynamic> response =
//   await dio.post("/book/detail/1", data: dto.toJson());
//   Logger().d(response.headers);
//   // Logger().d(response.data);
//   //
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   Logger().d(responseDTO.code);
//   // Logger().d(responseDTO.msg);
//   Logger().d(responseDTO.data);
// }
// OneMonthPressBookListModel model =
//
// Logger().d(model.bookLike);
// Logger().d(model.bookDetailReplyList[0]);
// Logger().d(model.bookDetailReplyList[1]);
// Logger().d(model.bookDetailReplyList[2]);
// Logger().d(model.bookId);

// BookCategory category = BookCategory.fromJson(model.bookCategory);
// Logger().d(responseDTO.code);
// Logger().d(responseDTO.data);
//   List<dynamic> mapList = responseDTO.data as List<dynamic>;
//   Logger().d(mapList);
//   List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();
//   responseDTO.data = bookList;}

// 스토리 카테고리별 책 목록
Future<void> fetchStoryBookList(int categoryId) async {
  // 통신
  Response<dynamic> response =
<<<<<<< HEAD
      await dio.get("/book/storyCategory/${categoryId}");
  // Logger().d("결과 : ${response.data}");
  // 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

  TodayStoryModel model = TodayStoryModel.fromJson(responseDTO.data);
  Logger().d("결과 : ${model.storyBookList}");
  Logger().d("결과 : ${model.storyBookList.length}");
  // responseDTO.data = model;
=======
      await dio.post("/book/search", data: bookSearchReqDTO.toJson());

  // 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d(responseDTO.data);


  SearchResultModel model = SearchResultModel.fromJson(responseDTO.data);
  Logger().d(model.keyword);
  Logger().d(model.bookKeywordList);
// BookCategory category = BookCategory.fromJson(model.bookCategory);
// Logger().d(responseDTO.code);
// Logger().d(responseDTO.data);
//   List<dynamic> mapList = responseDTO.data as List<dynamic>;
//   Logger().d(mapList);
//   List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();
//   responseDTO.data = bookList;}
}

Future<void> notifyInit(BookCategoryReqDTO bookCategoryReqDTO) async {
  ResponseDTO responseDTO =
      await BookRepository().fetchCategoryBookList(bookCategoryReqDTO);
  SearchCategoryBookListModel model = responseDTO.data;

  Logger().d(model);
  Logger().d(model.bookCategoryId);
  Logger().d(model.byCategoryPages);
  Logger().d(model.bookCount);
}

Future<void> fetchSearchBookOrBoard(BookSearchReqDTO bookSearchReqDTO) async {
  // 통신
  Response<dynamic> response =
      await dio.post("/book/search", data: bookSearchReqDTO.toJson());

  // 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d(responseDTO.data);

  SearchResultModel model = SearchResultModel.fromJson(responseDTO.data);
  Logger().d(model.keyword);
  Logger().d(model.bookKeywordList);
}

Future<void> notifyInit2(BookSearchReqDTO bookSearchReqDTO) async {
  ResponseDTO responseDTO =
      await BookRepository().fetchSearchBookOrBoard(bookSearchReqDTO);
  SearchResultModel model = responseDTO.data;
  Logger().d(model.keyword);
>>>>>>> dev
}
