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

/// 창고
class SessionUser {
  // context 접근
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  Future<void> join(JoinReqDTO joinReqDTO) async {
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    Navigator.pushNamed(mContext!, Move.LoginPage);
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    // 비즈니스 로직
    if (responseDTO.code == 1) {
      // 세션 값 갱신 : 로그인이 성공하면, 창고 데이터 갱신
      this.user = responseDTO.data; // TODO : as 생략 = 컨벤션
      this.jwt = responseDTO.token;
      this.isLogin = true;

      // 디바이스에 JWT 저장 : 자동로그인
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 메인으로 화면 이동
      // TODO 은혜 : 메인 페이지 완성 시 이동
      Navigator.pushNamed(mContext!, Move.MillieIndexStackNavigationBar);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  Future<void> userUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
    String jwt = await secureStorage.read(key: 'jwt') as String;
    ResponseDTO responseDTO =
        await UserRepository().fetchUserUpdate(jwt, userUpdateReqDTO);

    if (responseDTO.code == 1) {
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  Future<void> resignation() async {
    String jwt = await secureStorage.read(key: 'jwt') as String;
    ResponseDTO responseDTO = await UserRepository().fetchResignation(jwt);

    if (responseDTO.code == 1) {
      Navigator.of(mContext!)
          .pushNamedAndRemoveUntil('/loginJoin', (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  Future<void> logout() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }

  Future<void> paymentStateUpdate() async {
    this.user?.paymentStatus = true;
  }
}

/// 창고 관리자
final sessionStore = Provider<SessionUser>((ref) {
  return SessionUser();
});
