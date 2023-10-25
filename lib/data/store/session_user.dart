import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 창고 데이터
class SessionUser {
  // context 접근
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  /// fetchJoin
  Future<void> join(JoinIdAndEmailRequestDTO joinReqDTO) async {
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 비즈니스 로직
    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.LoginPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  /// fetchLogin
  Future<void> login(LoginRequestDTO loginReqDTO) async {
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    // 비즈니스 로직
    if (responseDTO == 1) {
      // 세션 값 갱신 : 로그인이 성공하면, 창고 데이터 갱신
      this.user = responseDTO.data; // TODO : as 생략 = 컨벤션
      this.jwt = responseDTO.token;
    }
  }
}

/// 창고 관리자
final sessionStore = Provider<SessionUser>((ref) {
  return SessionUser();
});
