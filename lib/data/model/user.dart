class User {
  late int id;
  late String username; // id
  late String email; // 이메일
  late String nickname; // 닉네임
  late String picUrl; // 이미지
  final String? createdAt; // 등록일

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.nickname,
      required this.picUrl,
      this.createdAt});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "nickname": nickname,
        "picUrl": picUrl
      };

  // 2. Map -> Dart(response) * createdAt 추가
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        nickname = json["nickname"],
        picUrl = json["picUrl"],
        createdAt = json["createdAt"];
}

/// mock 데이터

User user = User(
    id: 1,
    username: "ssar",
    email: "ssar@nate.com",
    nickname: "유재석",
    picUrl: "user1.png",
    createdAt: "2023-10-10");

List<User> users = [
  User(
      id: 1,
      username: "ssar",
      email: "ssar@nate.com",
      nickname: "유재석",
      picUrl: "user1.png",
      createdAt: "2023-10-10"),
  User(
      id: 2,
      username: "ssar1",
      email: "ssar1@nate.com",
      nickname: "박명수",
      picUrl: "user2.png",
      createdAt: "2023-10-10"),
  User(
      id: 3,
      username: "ssar2",
      email: "ssar2@nate.com",
      nickname: "하동훈",
      picUrl: "user3.png",
      createdAt: "2023-10-10"),
  User(
      id: 4,
      username: "cos",
      email: "cos@nate.com",
      nickname: "정준하",
      picUrl: "user4.png",
      createdAt: "2023-10-10"),
  User(
      id: 5,
      username: "cos1",
      email: "cos1@nate.com",
      nickname: "정형돈",
      picUrl: "user5.png",
      createdAt: "2023-10-10"),
];
