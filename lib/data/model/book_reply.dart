import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/user.dart';

class BookReply {
  final int id;
  final String content;
  final String createdAt;
  final User user;
  final Book book;

  BookReply({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.user,
    required this.book,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt,
      'user': user.toJson(),
      'book': book.toJson(), // Book 클래스의 toJson 메서드 사용
    };
  }

  factory BookReply.fromJson(Map<String, dynamic> json) {
    return BookReply(
      id: json['id'],
      content: json['content'],
      createdAt: json['createdAt'],
      user: User.fromJson(json['user']),
      book: Book.fromJson(json['book']), // Book 클래스의 fromJson 메서드 사용
    );
  }
}
