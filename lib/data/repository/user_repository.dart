import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    Logger().d("fetchJoin", requestDTO);

    // ★ 통신은 무조건 try 해야 한다.
    // dio는 200 외에 내부적으로 터져서 try-catch 해야한다.
    try {
      final response = await dio.post("/join", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
      // 정상응답이면 1
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(-1, "모두 입력되지 않았습니다.", null);
    }
  }

  /// fetchLogin
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      final response = await dio.post("/login", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      User user = User.fromJson(responseDTO.data);

      // 파싱한 user 데이터 다시 responseDTO.data에 담기
      responseDTO.data = user;

      // 토큰 세션값 변경을 위해 response의 헤더의 jwt를 가져와서 등록하기
      final jwt = response.headers["Authorization"];
      if (jwt != null) {
        responseDTO.token = jwt.first; // = jwt[0]
      }

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "유저네임 혹은 비밀번호가 틀렸습니다.", null);
    }
  }

  Future<ResponseDTO> fetchResignation(String jwt) async {
    try {
      Logger().d("레파지토리");
      Logger().d(jwt);

      final response = await dio.get("/user/delete",
          options: Options(headers: {"Authorization": "$jwt"}));

      Logger().d("여기는???????????");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(-1, "탈퇴에 실패했습니다 - 레파지토리에서 오류", null);
    }
  }
}
