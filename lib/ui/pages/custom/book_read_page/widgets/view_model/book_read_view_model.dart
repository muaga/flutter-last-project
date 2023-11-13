// 창고 데이터
import 'package:flutter_blog/data/dto/request_dto/book_mark_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_data_repository.dart';
import 'package:flutter_blog/data/repository/book_mark_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookReadModel {
  late List<String> bookdata;
  late List<BookMarkDTO>? bookMarkDTOList;
  BookReadModel({this.bookMarkDTOList, required this.bookdata});

  factory BookReadModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp1 = json["bookdata"];
    List<String> bookdata = temp1.map((e) => e.toString()).toList();
    List<dynamic> temp2 = json["bookMarkDTOList"];
    List<BookMarkDTO>? bookMarkDTOList =
        temp2.map((e) => BookMarkDTO.fromJson(e)).toList();
    return BookReadModel(bookdata: bookdata, bookMarkDTOList: bookMarkDTOList);
  }
}

class BookMarkDTO {
  final int? id;
  final int? scroll;
  final String? bookMarkCreatedAt;
  BookMarkDTO({this.bookMarkCreatedAt, this.scroll, this.id});
  BookMarkDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        scroll = json["scroll"],
        bookMarkCreatedAt = json["bookMarkCreatedAt"];
}

class checkDTO {
  final int bookMark;
  checkDTO({required this.bookMark});
  checkDTO.fromJson(Map<String, dynamic> json) : bookMark = json["bookMark"];
}

// 창고
class BookReadViewModel extends StateNotifier<BookReadModel?> {
  BookReadViewModel(super._state, this.ref);

  Ref ref;

  Future<BookReadModel> notifyInit(int bookId) async {
    SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO = await BookDataRepository()
        .fetchBookDataDetail(bookId, sessionUser.jwt!);
    BookReadModel model = responseDTO.data;
    state = BookReadModel(
        bookMarkDTOList: model.bookMarkDTOList, bookdata: model.bookdata);
    Logger().d(state?.bookdata);

    return BookReadModel(
        bookdata: model.bookdata, bookMarkDTOList: model.bookMarkDTOList);
  }

  // 페이지 북마크 등록 및 삭제
  Future<void> bookMark(BookMarkReqDTO bookMarkReqDTO) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO = await BookMarkRepository()
        .fetchBookMark(bookMarkReqDTO, sessionUser.jwt!);

    BookMarkDTO bookMark = responseDTO.data;

    // bookMarkDTO의 bookMark 번호가 1이라면, 추가
    if (bookMark == 1) {
      // 데이터 갱신

      BookReadModel? model = state; // 777
      model?.bookMarkDTOList = [bookMark, ...?model.bookMarkDTOList];
      state = BookReadModel(
          bookdata: model!.bookdata, bookMarkDTOList: model.bookMarkDTOList);
    }
  }
}

// 창고 관리자 = bookId를 인수로 받음
final bookReadProvider =
    StateNotifierProvider.family<BookReadViewModel, BookReadModel?, int>(
        (ref, bookId) {
  return BookReadViewModel(null, ref)..notifyInit(bookId);
});
