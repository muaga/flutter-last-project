import 'package:intl/intl.dart';

class User {
  final int id;
  final String? username; // id
  final String? email; // 이메일
  final String? nickname; // 닉네임
  final String? picUrl; // 이미지
  final DateTime? createdAt; // 등록일

  User(
      {required this.id,
      this.username,
      this.email,
      this.nickname,
      this.picUrl,
      this.createdAt});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "nickname": nickname,
        "picUrl": picUrl,
        "createdAt": createdAt
      };

  // 2. Map -> Dart(response)
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        nickname = json["nickname"],
        picUrl = json["picUrl"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]); // 3
}

/// mock 데이터
User user = User(
    id: 1,
    username: "ssar",
    // password: "1234",
    email: "ssar@nate.com",
    nickname: "ssar");
