import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 창고 데이터
class SessionUser {
  // context 접근
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  /// fetchJoin
  Future<void> join(JoinRequestDTO joinReqDTO) async {
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    Logger().d("fetch");
    Logger().d("code : ${responseDTO.code}");
    Logger().d("data : ${responseDTO.data}");
    // 비즈니스 로직
    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.LoginPage);
      Logger().d("통신결과 : ${responseDTO.code}");
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
      Logger().d("통신결과 : ${responseDTO.code}");
    }
  }

  /// fetchLogin
  Future<void> login(LoginRequestDTO loginReqDTO) async {
    Logger().d("store : ${loginReqDTO}");
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
    Logger().d("레파지토리 통과");
    // 비즈니스 로직
    if (responseDTO == 1) {
      Logger().d("통신코드 1");
      // 세션 값 갱신 : 로그인이 성공하면, 창고 데이터 갱신
      this.user = responseDTO.data; // TODO : as 생략 = 컨벤션
      Logger().d("user: ${user}");
      this.jwt = responseDTO.token;
      this.isLogin = true;
      // 디바이스에 JWT 저장 : 자동로그인
      await secureStorage.write(key: "jwt", value: responseDTO.token);
      // 메인으로 화면 이동
      // TODO 은혜 : 메인 페이지 완성 시 이동
      Navigator.pushNamed(mContext!, Move.NowBookListPage);
    } else {
      Logger().d("통신코드 -1");
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }
}

/// 창고 관리자
final sessionStore = Provider<SessionUser>((ref) {
  return SessionUser();
});
