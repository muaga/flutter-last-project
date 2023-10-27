/// !! spring의 model과 변수명이 일치해야 찾아올 수 있다.
class Book {
  final int? id;
  final String? picUrl;
  final String? title;
  final String? writer;
  final String? content;

  Book({this.id, this.picUrl, this.title, this.writer, this.content});

  // Map 형태로 변환합니다.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'picUrl': picUrl,
      'title': title,
      'writer': writer,
      'content': content,
    };
  }

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      picUrl: json["picUrl"],
      title: json["title"],
      writer: json["writer"],
      content: json["content"],
    );
  }
}
