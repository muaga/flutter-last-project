import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/view-model/book_store_best_book_list_view_model.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';

// 통신 & 파싱
class BookRepository {
  // 책 상세보기
  Future<ResponseDTO> fetchBookDetail(int bookId, String jwt) async {
    try {
      // 통신
      Response response = await dio.get(
        "/book/detail/$bookId",
        options: Options(headers: {"Authorization": jwt}),
      );

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      BookDetailModel book = BookDetailModel.fromJson(responseDTO.data);
      responseDTO.data = book;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 한건 불러오기 실패", null);
    }
  }

  // 한달 이내 출간된 책 목록
  Future<ResponseDTO> fetchMonthBookList(
      BookMonthReqDTO bookMonthReqDTO) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.post("/book/monthList", data: bookMonthReqDTO.toJson());

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      OneMonthPressBookListModel model =
          OneMonthPressBookListModel.fromJson(responseDTO.data);

      responseDTO.data = model;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }

  // 카테고리별 책 목록
  Future<ResponseDTO> fetchCategoryBookList(
      BookCategoryReqDTO bookCategoryReqDTO) async {
    try {
      // 통신
      Response<dynamic> response = await dio.post("/book/bookCategory",
          data: bookCategoryReqDTO.toJson());
      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      SearchCategoryBookListModel model =
          SearchCategoryBookListModel.fromJson(responseDTO.data);

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }

  // 스토리 카테고리별 책 목록
  Future<ResponseDTO> fetchStoryBookList(int categoryId) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.get("/book/storyCategory/${categoryId}");
      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      TodayStoryModel model = TodayStoryModel.fromJson(responseDTO.data);

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }

  // 책, 포스트 검색 결과
  Future<ResponseDTO> fetchSearchBookOrBoard(
      BookSearchReqDTO bookSearchReqDTO) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.post("/book/search", data: bookSearchReqDTO.toJson());

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      SearchResultModel model = SearchResultModel.fromJson(responseDTO.data);

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }

  // 서점 베스트 책 목록
  Future<ResponseDTO> fetchBestBookList(BookBestReqDTO bookBestReqDTO) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.post("/book/rankingList", data: bookBestReqDTO.toJson());

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      BookStoreBestBookListModel model =
          BookStoreBestBookListModel.fromJson(responseDTO.data);

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }
}
