import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch(LoginRequestDTO(uesrname: "cos", password: "1234"));
}

/// TODO : 통신 테스트
Future<void> fetch(LoginRequestDTO requestDTO) async {
  try {
    Response<dynamic> response =
        await dio.post("/login", data: requestDTO.toJson());
    Logger().d("서버 성공: ${response.data}");
    // 성공적인 응답 처리
  } on DioError catch (e) {
    if (e.response != null) {
      // 서버 응답이 있는 경우 (예: 상태 코드 400)
      Logger().e("서버 응답 에러: ${e.response?.data}");
    } else {
      // 요청이 실패한 경우
      Logger().e("요청 실패: ${e.message}");
    }
  }

  // // Logger().d(response.data);
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // // Logger().d(responseDTO.code);
  // // Logger().d(responseDTO.data);
  // List<dynamic> mapList = responseDTO.data as List<dynamic>;
  // Logger().d(mapList);
  // List<User> bookList = mapList.map((e) => User.fromJson(e)).toList();
  // responseDTO.data = user;
  // print("username : ${user.username}");
  // print("email : ${user.email}");
}
