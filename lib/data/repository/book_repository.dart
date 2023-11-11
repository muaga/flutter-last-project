import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/view_model/search_main_view_model.dart';

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

  // 책 목록보기
  Future<ResponseDTO> fetchBookList(BookReqDTO dto) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.post("/book/monthList", data: dto.toJson());

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();

      responseDTO.data = bookList;
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
}
