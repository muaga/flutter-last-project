import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response.dart';
import 'package:flutter_blog/data/model/Book.dart';

// 통신 & 파싱
class BookRepository {
  // 책 상세보기
  Future<ResponseDTO> fetchBookDetail(int id) async {
    try {
      // 통신
      Response response = await dio.get("/books/$id");
      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Book book = Book.fromJson(responseDTO.data);
      responseDTO.data = book;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 한건 불러오기 실패", null);
    }
  }

  // 책 목록보기
  Future<ResponseDTO> fetchBookList() async {
    try {
      // 통신
      Response<dynamic> response = await dio.get("/books");

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
}
