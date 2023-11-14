import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDA0ODE4OTZ9.eDqGN5C81bobxsxwFTyQrC546m_ZWOHyZheoQ7WgZpcF4WuGtszrcd3H8aJG6jPlJjmL1mRD6jKQJCZ-crQAhA";

  await fetchCategoryBookList(1);
}

Future<void> fetchBookDetail(int bookId, String jwt) async {
  // 통신
  Response response = await dio.get(
    "/book/detail/1",
    options: Options(headers: {"Authorization": jwt}),
  );

  Logger().d(response);

  // 파싱
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // BookDetailModel book = BookDetailModel.fromJson(responseDTO.data);
  // responseDTO.data = book;
}

Future<void> fetchCategoryBookList(int categoryId) async {
  // 통신
  Response<dynamic> response =
      await dio.post("/book/bookCategory/${categoryId}");

  Logger().d(response);
  // 파싱
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //
  // SearchCategoryBookListModel model =
  // SearchCategoryBookListModel.fromJson(responseDTO.data);
}
