import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/delayed_reponse.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  /// fetchJoin
  Future<ResponseDTO> fetchJoin(JoinIdAndEmailRequestDTO requestDTO) {
    return Future.delayed(
        Duration(seconds: 5), () => ResponseDTO(1, "통신완료", Answer));
  }

  /// fetchLogin
  Future<ResponseDTO> fetchLogin(LoginRequestDTO requestDTO) async {
    Logger().d("requestDTO : ${requestDTO.uesrname}");
    Logger().d("requestDTO : ${requestDTO.password}");
    try {
      Logger().d("1");
      final response = await dio.post("/login", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = User.fromJson(responseDTO.data);

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
}
