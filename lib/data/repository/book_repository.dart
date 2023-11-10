import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';

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

  //내 서재 불러오기
  Future<ResponseDTO> fetchMyLibrary(String jwt) async {
    try {
      Response response = await dio.get("/book/bookOfMine",
          options: Options(headers: {"Authorization": jwt}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      MyLibraryModel dto = MyLibraryModel.fromJson(responseDTO.data);
      responseDTO.data = dto;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "내 서재 불러오기 실패 - 레파지토리 터짐 ", null);
    }
  }
}
