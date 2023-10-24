import 'package:intl/intl.dart';

class User {
  final int id;
  final String? username; // id
  final String? password; // 비밀번호
  final String? email; // 이메일
  final String? nickname; // 닉네임
  final String? picUrl; // 이미지
  final DateTime? createdAt; // 등록일

  User(
      {required this.id,
      this.username,
      this.password,
      this.email,
      this.nickname,
      this.picUrl,
      this.createdAt});

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        password = json["password"],
        email = json["email"],
        nickname = json["nickname"],
        picUrl = json["picUrl"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]); // 3
}

/// mock 데이터
User user = User(
    id: 1,
    username: "ssar",
    password: "1234",
    email: "ssar@nate.com",
    nickname: "ssar");
