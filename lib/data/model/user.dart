class User {
  final int id;
  final String? username; // id
  final String? email; // 이메일
  final String? nuckname; // 닉네임
  final String? picUrl; // 이미지
  //final DateTime? createdAt; // 등록일

  User(
      {required this.id,
      this.username,
      this.email,
      this.nuckname,
      this.picUrl});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "nuckname": nuckname,
        "picUrl": picUrl
      };

  // 2. Map -> Dart(response)
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        nuckname = json["nuckname"],
        picUrl = json["picUrl"]; // 3
}

/// mock 데이터
User user = User(
    id: 1,
    username: "ssar",
    // password: "1234",
    email: "ssar@nate.com",
    nuckname: "ssar");
