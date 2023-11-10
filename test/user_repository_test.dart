import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch(LoginReqDTO(username: "ssar", password: "1234"));
}

/// TODO : 통신 테스트
Future<void> fetch(LoginReqDTO dto) async {
  Response<dynamic> response = await dio.post("/login", data: dto.toJson());
  // Logger().d(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d(responseDTO.code);
  // Logger().d(responseDTO.msg);
  // Logger().d(responseDTO.data);
  //
  // User user = User.fromJson(responseDTO.data);
  // Logger().d(user.username);
  // Logger().d(user.username);
  // Logger().d(user.username);

  // Logger().d(responseDTO.msg);
  Logger().d(responseDTO.token);
}
