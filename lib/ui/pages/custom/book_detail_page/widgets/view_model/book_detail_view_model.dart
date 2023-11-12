import 'package:flutter_blog/data/dto/request_dto/book_like_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book_category.dart';
import 'package:flutter_blog/data/repository/book_like_repository.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class BookDetailModel {
  late int bookId;
  late int bookLike;
  late String bookPicUrl;
  late String bookTitle;
  late String bookWriter;
  late int bookLikeCount;
  late int bookReplyCount;
  late String bookSubTitle;
  late String bookIntroduction;
  late BookCategory bookCategory; // Map
  late String totalPage;
  late String publicationDate;
  late String sequence;
  late String writerIntroduction;
  late String review;
  late List<BookDetailReplyList> bookDetailReplyList; // List

  BookDetailModel.copy(BookDetailModel model)
      : this.bookId = model.bookId,
        this.bookLike = model.bookLike;

  BookDetailModel({
    required this.bookId,
    required this.bookLike,
    required this.bookPicUrl,
    required this.bookTitle,
    required this.bookWriter,
    required this.bookLikeCount,
    required this.bookReplyCount,
    required this.bookSubTitle,
    required this.bookIntroduction,
    required this.bookCategory,
    required this.totalPage,
    required this.publicationDate,
    required this.sequence,
    required this.writerIntroduction,
    required this.review,
    required this.bookDetailReplyList,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["bookDetailReplyList"];
    List<BookDetailReplyList> bookDetailReplyList =
        temp.map((e) => BookDetailReplyList.fromJson(e)).toList();

    return BookDetailModel(
      bookId: json["bookId"],
      bookLike: json["bookLike"],
      bookPicUrl: json["bookPicUrl"],
      bookTitle: json["bookTitle"],
      bookWriter: json["bookWriter"],
      bookLikeCount: json["bookLikeCount"],
      bookReplyCount: json["bookReplyCount"],
      bookSubTitle: json["bookSubTitle"],
      bookIntroduction: json["bookIntroduction"],
      bookCategory: BookCategory.fromJson(json["bookCategory"]), // Object
      totalPage: json["totalPage"],
      // publicationDate: DateTime.parse(json["publicationDate"]),
      publicationDate: json["publicationDate"],
      sequence: json["sequence"],
      writerIntroduction: json["writerIntroduction"],
      review: json["review"],
      bookDetailReplyList: bookDetailReplyList, // Object
    );
  }
}

class BookDetailReplyList {
  String? nickname;
  String? userPicUrl;
  String? replyCreatedAt;
  String? replyContent;

  BookDetailReplyList({
    this.nickname,
    this.userPicUrl,
    this.replyCreatedAt,
    this.replyContent,
  });

  factory BookDetailReplyList.fromJson(Map<String, dynamic> json) =>
      BookDetailReplyList(
        nickname: json["nickname"],
        userPicUrl: json["userPicUrl"],
        replyCreatedAt: json["replyCreatedAt"],
        replyContent: json["replyContent"],
      );
}

class BookLikeDTO {
  int bookLike;

  BookLikeDTO({required this.bookLike});

  BookLikeDTO.fromJson(Map<String, dynamic> json) : bookLike = json["bookLike"];
}

// 창고
class BookDetailViewModel extends StateNotifier<BookDetailModel?> {
  BookDetailViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit(int bookId) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO =
        await BookRepository().fetchBookDetail(bookId, sessionUser.jwt!);
    BookDetailModel model = responseDTO.data;
    state = BookDetailModel(
        bookId: model.bookId,
        bookLike: model.bookLike,
        bookPicUrl: model.bookPicUrl,
        bookTitle: model.bookTitle,
        bookWriter: model.bookWriter,
        bookLikeCount: model.bookLikeCount,
        bookReplyCount: model.bookReplyCount,
        bookSubTitle: model.bookSubTitle,
        bookIntroduction: model.bookIntroduction,
        bookCategory: model.bookCategory,
        totalPage: model.totalPage,
        publicationDate: model.publicationDate,
        sequence: model.sequence,
        writerIntroduction: model.writerIntroduction,
        review: model.review,
        bookDetailReplyList: model.bookDetailReplyList);
  }

  // 북 스크랩 등록
  Future<void> bookLikeWrite(BookLikeReqDTO requestDTO) async {
    SessionUser sessionUser = ref.read(sessionStore);

    // BookLikeRequestDTO와 sessionUser.jwt를 fetchBookLikeWrite 메서드로 전달
    ResponseDTO responseDTO = await BookLikeRepository()
        .fetchBookLikeWrite(requestDTO, sessionUser.jwt!);

    // 데이터 갱신

    BookDetailModel? model = state; // 777
    model!.bookLike = model!.bookLike * -1;

    state = BookDetailModel(
        bookId: model.bookId,
        bookLike: model.bookLike,
        bookPicUrl: model.bookPicUrl,
        bookTitle: model.bookTitle,
        bookWriter: model.bookWriter,
        bookLikeCount: model.bookLikeCount,
        bookReplyCount: model.bookReplyCount,
        bookSubTitle: model.bookSubTitle,
        bookIntroduction: model.bookIntroduction,
        bookCategory: model.bookCategory,
        totalPage: model.totalPage,
        publicationDate: model.publicationDate,
        sequence: model.sequence,
        writerIntroduction: model.writerIntroduction,
        review: model.review,
        bookDetailReplyList: model.bookDetailReplyList);
  }
}

final bookDetailProvider =
    StateNotifierProvider.family<BookDetailViewModel, BookDetailModel?, int>(
        (ref, bookId) {
  return BookDetailViewModel(null, ref)..notifyInit(bookId);
});
