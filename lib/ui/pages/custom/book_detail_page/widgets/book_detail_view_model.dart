import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class BookDetailModel {
  late int bookId;
  late String bookTitle;
  late String bookWriter;
  late int bookLikes;
  late int bookReplys;
  late String bookSubTitle;
  late String introduction;
  late BookCategory bookCategory; // Map
  late String totalPage;
  late DateTime publicationDate;
  late String sequence;
  late String writerIntroduction;
  late String review;
  late List<BookDetailReplyDTO> bookDetailReplyDTO; // List

  BookDetailModel({
    required this.bookId,
    required this.bookTitle,
    required this.bookWriter,
    required this.bookLikes,
    required this.bookReplys,
    required this.bookSubTitle,
    required this.introduction,
    required this.bookCategory,
    required this.totalPage,
    required this.publicationDate,
    required this.sequence,
    required this.writerIntroduction,
    required this.review,
    required this.bookDetailReplyDTO,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["bookDetailReplyDTO"];
    List<BookDetailReplyDTO> bookDetailReplyDTO =
        temp.map((e) => BookDetailReplyDTO.fromJson(e)).toList();

    return BookDetailModel(
      bookId: json["bookId"],
      bookTitle: json["bookTitle"],
      bookWriter: json["bookWriter"],
      bookLikes: json["bookLikes"],
      bookReplys: json["bookReplys"],
      bookSubTitle: json["bookSubTitle"],
      introduction: json["introduction"],
      bookCategory: BookCategory.fromJson(json["bookCategory"]), // Object
      totalPage: json["totalPage"],
      publicationDate: DateTime.parse(json["publicationDate"]),
      sequence: json["sequence"],
      writerIntroduction: json["writerIntroduction"],
      review: json["review"],
      bookDetailReplyDTO: bookDetailReplyDTO, // Object
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

class BookDetailReplyDTO {
  String? nickname;
  String? userPicUrl;
  DateTime? replyCreatedAt;
  String? replyContent;

  BookDetailReplyDTO({
    this.nickname,
    this.userPicUrl,
    this.replyCreatedAt,
    this.replyContent,
  });

  factory BookDetailReplyDTO.fromJson(Map<String, dynamic> json) =>
      BookDetailReplyDTO(
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

  Future<void> notifyInit(int id) async {
    ResponseDTO responseDTO = await BookRepository().fetchBookDetail(id);
    BookDetailModel model = BookDetailModel.fromJson(responseDTO.data);
    // BookCategory category = BookCategory.fromJson(model.bookCategory);
    // state = BookDetailModel(responseDTO.data);
  }
}

final bookDetailProvider = StateNotifierProvider.autoDispose
    .family<BookDetailViewModel, BookDetailModel?, int>((ref, bookId) {
  return BookDetailViewModel(null, ref)..notifyInit(bookId);
});
