import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고 데이터
class BookDetailModel {
  late int bookId;
  late String bookPicUrl;
  late String bookTitle;
  late String bookWriter;
  late int bookLikeCount;
  late int bookReplyCount;
  late String bookSubTitle;
  late String bookIntroduction;
  late BookCategory bookCategory; // Map
  late String totalPage;
  late DateTime publicationDate;
  late String sequence;
  late String writerIntroduction;
  late String review;
  late List<BookDetailReplyList> bookDetailReplyList; // List

  BookDetailModel({
    required this.bookId,
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
      bookPicUrl: json["bookPicUrl"],
      bookTitle: json["bookTitle"],
      bookWriter: json["bookWriter"],
      bookLikeCount: json["bookLikeCount"],
      bookReplyCount: json["bookReplyCount"],
      bookSubTitle: json["bookSubTitle"],
      bookIntroduction: json["bookIntroduction"],
      bookCategory: BookCategory.fromJson(json["bookCategory"]), // Object
      totalPage: json["totalPage"],
      publicationDate: DateTime.parse(json["publicationDate"]),
      sequence: json["sequence"],
      writerIntroduction: json["writerIntroduction"],
      review: json["review"],
      bookDetailReplyList: bookDetailReplyList, // Object
    );
  }
}

class BookCategory {
  int? id;
  String? categoryName;

  BookCategory({
    this.id,
    this.categoryName,
  });

  factory BookCategory.fromJson(Map<String, dynamic> json) => BookCategory(
        id: json["id"],
        categoryName: json["categoryName"],
      );
}

class BookDetailReplyList {
  String? nickname;
  String? userPicUrl;
  DateTime? replyCreatedAt;
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
        replyCreatedAt: DateTime.parse(json["replyCreatedAt"]),
        replyContent: json["replyContent"],
      );

  // alt+insert
  @override
  String toString() {
    return 'BookDetailReplyDTO{nickname: $nickname, userPicUrl: $userPicUrl, replyCreatedAt: $replyCreatedAt, replyContent: $replyContent}';
  }
}

// 창고
class BookDetailViewModel extends StateNotifier<BookDetailModel?> {
  BookDetailViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit(int bookId) async {
    ResponseDTO responseDTO = await BookRepository().fetchBookDetail(bookId);
    BookDetailModel model = responseDTO.data;
    Logger().d("model : ${model}");
    Logger().d("model.bookTitle : ${model.bookTitle}");
    state = BookDetailModel(
        bookId: model.bookId,
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

final bookDetailProvider = StateNotifierProvider.autoDispose
    .family<BookDetailViewModel, BookDetailModel?, int>((ref, bookId) {
  return BookDetailViewModel(null, ref)..notifyInit(bookId);
});
