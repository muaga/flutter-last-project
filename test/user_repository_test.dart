import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAzNjY1OTR9.VdqjdU8Mj-RV6NCfKn8VmArqikOnA5jLfNCLk434sCzlkrUgG3x5nhaggCsaHbFpQKSO3k8oGVRv9Dn6L1K3bg";
  UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(
      nickName: "유유재석", password: "1234", email: "uusuck@nate.com");

  await fetchUserUpdate(jwt, userUpdateReqDTO);
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

Future<void> fetchUserUpdate(
    String jwt, UserUpdateReqDTO userUpdateReqDTO) async {
  Response response = await dio.post("/user/update",
      data: userUpdateReqDTO.toJson(),
      options: Options(headers: {"Authorization": "$jwt"}));
  Logger().d(response.data);
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
}
