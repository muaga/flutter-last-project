import 'dart:convert';

import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryModel {
  int bookLikeCount;
  List<LikeListDTO> likeBookList;
  List<ReadingBookDTO> readingBookList;
  PostDTO postList;

  MyLibraryModel(
      {required this.bookLikeCount,
      required this.likeBookList,
      required this.readingBookList,
      required this.postList});

  MyLibraryModel.fromJson(Map<String, dynamic> json)
      : bookLikeCount = json["bookLikeCount"],
        likeBookList = (json["likeBookList"] as List)
            .map((e) => LikeListDTO.fromJson(e))
            .toList(),
        readingBookList = (json["readingBookList"] as List)
            .map((e) => ReadingBookDTO.fromJson(e))
            .toList(),
        postList = PostDTO.fromJson(json["postDTO"]);
}

class LikeListDTO {
  final int bookLikeId;
  final int bookLikeUserId;
  final int bookId;
  final String likeBookPicUrl;
  final String likeBookTitle;
  final String likeWriter;

  LikeListDTO(
      {required this.bookLikeId,
      required this.bookLikeUserId,
      required this.bookId,
      required this.likeBookPicUrl,
      required this.likeBookTitle,
      required this.likeWriter});

  LikeListDTO.fromJson(Map<String, dynamic> json)
      : bookLikeId = json["bookLikeId"],
        bookLikeUserId = json["bookLikeUserId"],
        bookId = json["bookId"],
        likeBookPicUrl = json["likeBookPicUrl"],
        likeBookTitle = json["likeBookTitle"],
        likeWriter = json["likeWriter"];
}

class ReadingBookDTO {
  final int readingBookId;
  final int readingBookUserId;
  final int bookId;
  final String bookReadingPicUrl;
  final String bookReadingTitle;
  final String readingWriter;
  final String scroll;

  ReadingBookDTO(
      {required this.readingBookId,
      required this.readingBookUserId,
      required this.bookId,
      required this.bookReadingPicUrl,
      required this.bookReadingTitle,
      required this.readingWriter,
      required this.scroll});

  ReadingBookDTO.fromJson(Map<String, dynamic> json)
      : readingBookId = json["readingBookId"],
        readingBookUserId = json["readingBookUserId"],
        bookId = json["bookId"],
        bookReadingPicUrl = json["bookReadingPicUrl"],
        bookReadingTitle = json["bookReadingTitle"],
        readingWriter = json["readingWriter"],
        scroll = json["scroll"];
}

class PostDTO {
  final int replyCount;
  final ReplyDTO replyList;
  final int boardCount;
  final List<BoardDTO> boardList;

  PostDTO(
      {required this.replyCount,
      required this.replyList,
      required this.boardCount,
      required this.boardList});

  PostDTO.fromJson(Map<String, dynamic> json)
      : replyCount = json["replyCount"],
        replyList = ReplyDTO.fromJson(json["replyList"]),
        boardCount = json["boardCount"],
        boardList = (json["boardList"] as List)
            .map((e) => BoardDTO.fromJson(e))
            .toList();
}

class ReplyDTO {
  final List<BookReplyDTO> bookReplyList;
  final List<BoardReplyDTO> boardReplyList;

  ReplyDTO({required this.bookReplyList, required this.boardReplyList});

  factory ReplyDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> bookReplyTemp = json["bookReplyList"];
    List<BookReplyDTO> bookReplyList =
        bookReplyTemp.map((e) => BookReplyDTO.fromJson(e)).toList();

    List<dynamic> boardReplyTemp = json["boardReplyList"];
    List<BoardReplyDTO> boardReplyList =
        boardReplyTemp.map((e) => BoardReplyDTO.fromJson(e)).toList();

    return ReplyDTO(
        bookReplyList: bookReplyList, boardReplyList: boardReplyList);
  }
}

class BookReplyDTO {
  final int bookReplyId;
  final String bookReplyContent;
  final String bookReplyCreatedAt;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BookReplyDTO(
      {required this.bookReplyId,
      required this.bookReplyContent,
      required this.bookReplyCreatedAt,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

  BookReplyDTO.fromJson(Map<String, dynamic> json)
      : bookReplyId = json["bookReplyId"],
        bookReplyContent = json["bookReplyContent"],
        bookReplyCreatedAt = json["bookReplyCreatedAt"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

class BoardReplyDTO {
  final int boardReplyId;
  final String boardReplyContent;
  final String boardReplyCreatedAt;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BoardReplyDTO(
      {required this.boardReplyId,
      required this.boardReplyContent,
      required this.boardReplyCreatedAt,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

  BoardReplyDTO.fromJson(Map<String, dynamic> json)
      : boardReplyId = json["boardReplyId"],
        boardReplyContent = json["boardReplyContent"],
        boardReplyCreatedAt = json["boardReplyCreatedAt"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

class BoardDTO {
  final int boardId;
  final String boardTitle;
  final String boardCreatedAt;

  BoardDTO(
      {required this.boardId,
      required this.boardTitle,
      required this.boardCreatedAt});

  BoardDTO.fromJson(Map<String, dynamic> json)
      : boardId = json["boardId"],
        boardTitle = json["boardTitle"],
        boardCreatedAt = json["boardCreatedAt"];
}

class MyLibraryViewModel extends StateNotifier<MyLibraryModel?> {
  Ref ref;

  MyLibraryViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionUser session = ref.read(sessionStore);
    ResponseDTO responseDTO =
        await BookRepository().fetchMyLibrary(session.jwt!);
    state = responseDTO.data;
  }
}

final myLibraryProvider =
    StateNotifierProvider<MyLibraryViewModel, MyLibraryModel?>((ref) {
  return MyLibraryViewModel(null, ref)..notifyInit();
});
