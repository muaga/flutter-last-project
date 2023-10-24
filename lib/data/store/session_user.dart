// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  /// 2. 통신의 상태코드로 나눈다.
  Future<void> join(JoinIdAndEmailRequestDTO joinReqDTO) async {
    // 1. 통신 코드

    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    // 2. 비즈니스 로직
    if (responseDTO.code == 1) {
      /// TODO 성훈 : 로그인 화면이 완성되면, Move 수정하기
      Navigator.pushNamed(mContext!, Move.NowBookListPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }
}

// 2. 창고 관리자
final sessionStore = Provider<SessionUser>((ref) {
  return SessionUser();
});
