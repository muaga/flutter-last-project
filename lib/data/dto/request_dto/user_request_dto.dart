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
