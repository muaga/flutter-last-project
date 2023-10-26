/// UserRequestDTO - toJson
// class User {
//   final int id;
//   final String? username; // id
//   final String? email; // 이메일
//   final String? nickname; // 닉네임
//   final String? picUrl; // 이미지
//   final DateTime? createdAt; // 등록일

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "username": username,
//   "password": password,
//   "email": email,
//   "nickname": nickname,
//   "picUrl": picUrl,
//   "created": createdAt,
// };

class JoinRequestDTO {
  final String username;
  final String email;
  final String password;
  final String? nickname; // 닉네임

  JoinRequestDTO(
      {required this.username,
      required this.email,
      required this.password,
      this.nickname});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "nickname": nickname,
      };
}

class LoginRequestDTO {
  final String username;
  final String password;

  LoginRequestDTO({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": password,
      };
}
