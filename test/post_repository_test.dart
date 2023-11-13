import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDA0NDE2MTJ9.AR2oHtjNo8Cr3tFwvlnNzZtjiNAxbndJxll4A4pWkXa5-F8ZwnY8Cl-LZYRI6mfNP_iga8M-F5fTcN2DcDt4Dg";

  await fetchDeletePost(jwt, 1);
}

// TODO : 통신 테스트

Future<void> fetchDeletePost(String jwt, int boardId) async {
  Response response = await dio.delete("/board/${boardId}/delete",
      options: Options(headers: {"Authorization": jwt}));
  Logger().d("응답 : $response");

  // 응답 받은 데이터 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d("응답 : $response.");

  // responseDTO.data = Post.fromJson(responseDTO.data);
}
