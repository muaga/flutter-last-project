import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDA0ODAzNzB9.twn16oq7p9735rS1jeNsHaLtcR_qh_mRjQYWD0d40vWp0F9HcSXhq4kNbNIjAUi9j7GOHxdynXyHY6mA1v9QYg";
  await fetchBookDetail(1, jwt);
}

Future<void> fetchBookDetail(int bookId, String jwt) async {
  // 통신
  Response response = await dio.get(
    "/book/detail/$bookId",
    options: Options(headers: {"Authorization": jwt}),
  );

  Logger().d(response);

  // 파싱
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // BookDetailModel book = BookDetailModel.fromJson(responseDTO.data);
  // responseDTO.data = book;
}
