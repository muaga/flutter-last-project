import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch(JoinRequestDTO(
      username: "h111g5h1",
      email: "sagfgddf@nate.com",
      password: "gfgfsadf",
      nickname: "gfgfsadf"));
}

/// TODO : 통신 테스트
Future<void> fetch(JoinRequestDTO dto) async {
  Response<dynamic> response = await dio.post("/join", data: dto.toJson());
  //Logger().d(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  Logger().d(responseDTO.code);
  Logger().d(responseDTO.msg);
  Logger().d(responseDTO.data);

  responseDTO.data = User.fromJson(responseDTO.data);

  Logger().d(responseDTO.code);
  Logger().d(responseDTO.msg);
  Logger().d(responseDTO.data);
}
