import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_profile_page/widgets/my_setting_profile_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAzNjY1OTR9.VdqjdU8Mj-RV6NCfKn8VmArqikOnA5jLfNCLk434sCzlkrUgG3x5nhaggCsaHbFpQKSO3k8oGVRv9Dn6L1K3bg";
  UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(
      nickname: "유유재석", password: "1234", email: "uusuck@nate.com");

  // await fetchUserUpdate(jwt, userUpdateReqDTO);
  await notifyInit(jwt);
}

/// TODO : 통신 테스트
Future<void> fetchUserUpdate(
    String jwt, UserUpdateReqDTO userUpdateReqDTO) async {
  Response response = await dio.post("/user/update",
      data: userUpdateReqDTO.toJson(),
      options: Options(headers: {"Authorization": "$jwt"}));
  Logger().d(response.data);
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
}

Future<void> notifyInit(String jwt) async {
  final response = await dio.get("/user/updatePage",
      options: Options(headers: {"Authorization": "$jwt"}));
  // Logger().d(response);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

  MySettingProfileModel model =
      MySettingProfileModel.fromJson(responseDTO.data);
  Logger().d(model);
}
