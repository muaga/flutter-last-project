import 'package:flutter_blog/data/delayed_reponse.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinIdAndEmailRequestDTO requestDTO) {
    return Future.delayed(
        Duration(seconds: 5), () => ResponseDTO(1, "통신완료", Answer));
  }

  Future<ResponseDTO> fetchLogin(LoginRequestDTO requestDTO) {
    return Future.delayed(
        Duration(seconds: 5), () => ResponseDTO(1, "통신완료", Answer));
  }
}
