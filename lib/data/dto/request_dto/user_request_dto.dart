/// UserRequestDTO - toJson
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "username": username,
//   "password": password,
//   "email": email,
//   "nickname": nickname,
//   "picUrl": picUrl,
//   "created": createdAt,
// };

class JoinIdAndEmailRequestDTO {
  final String username;
  final String email;

  JoinIdAndEmailRequestDTO({required this.username, required this.email});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
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
