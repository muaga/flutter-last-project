import 'package:dio/dio.dart';
import 'package:flutter_blog/data/dto/request_dto/book_like_request_dto.dart';

void main() async {
  await fetch(BookLikeReqDTO(bookId: 1, userId: 1));
}

/// TODO : 통신 테스트
Future<void> fetch(BookLikeReqDTO dto) async {
  // Response<dynamic> response = await dio.post("/login", data: dto.toJson());
  // // Logger().d(response.data);
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // // Logger().d(responseDTO.code);
  // // Logger().d(responseDTO.msg);
  // // Logger().d(responseDTO.data);
  // //
  // User user = User.fromJson(responseDTO.data);
  // //
  // Logger().d(user.username);
  // // Logger().d(responseDTO.msg);
  // // Logger().d(responseDTO.data);
}
