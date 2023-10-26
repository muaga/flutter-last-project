import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/delayed_reponse.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinRequestDTO requestDTO) async {
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
      return ResponseDTO(-1, "중복되는 유저명입니다.", null);
    }
  }

  Future<ResponseDTO> fetchLogin(LoginRequestDTO requestDTO) {
    return Future.delayed(
        Duration(seconds: 5), () => ResponseDTO(1, "통신완료", Answer));
  }
}
