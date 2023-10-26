import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch();
}

/// TODO : 통신 테스트
Future<void> fetch() async {
  Response<dynamic> response = await dio.get("/book/detail/1");
  Logger().d(response.data);
  // Logger().d(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  Logger().d(responseDTO.data);

  // Logger().d(responseDTO.code);
  // Logger().d(responseDTO.data);
  // List<dynamic> mapList = responseDTO.data as List<dynamic>;
  // Logger().d(mapList);
  // List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();
  // responseDTO.data = bookList;
  // print(bookList[0].picUrl);
  // print(bookList[0].title);
}
