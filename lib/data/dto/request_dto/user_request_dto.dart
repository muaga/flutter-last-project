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

class JoinReqDTO {
  final String username;
  final String email;
  final String password;
  final String nickname; // 닉네임

  JoinReqDTO(
      {required this.username,
      required this.email,
      required this.password,
      required this.nickname});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "nickname": nickname,
      };

  @override
  String toString() {
    return 'JoinRequestDTO{username: $username, email: $email, password: $password, nickname: $nickname}';
  }
}

class LoginReqDTO {
  final String username;
  final String password;

  LoginReqDTO({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class UserUpdateReqDTO {
  final String nickname;
  final String password;
  final String email;

  UserUpdateReqDTO(
      {required this.nickname, required this.password, required this.email});

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "password": password,
        "email": email,
      };
}

class PaymentReqDTO {
  final int userId;
  final String pay;

  PaymentReqDTO({required this.userId, required this.pay});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "pay": pay,
      };
}
