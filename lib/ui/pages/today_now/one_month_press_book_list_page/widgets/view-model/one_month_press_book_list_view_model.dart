import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 1. 창고 데이터
class OneMonthPressBookListModel {
  int bookCount;
  int bookCategoryId;
  List<BookListDTO> bookList;
  OneMonthPressBookListModel(
      {required this.bookCount,
      required this.bookCategoryId,
      required this.bookList});

  factory OneMonthPressBookListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["bookList"];
    List<BookListDTO> bookList =
        temp.map((e) => BookListDTO.fromJson(e)).toList();

    return OneMonthPressBookListModel(
        bookCount: json["bookCount"],
        bookCategoryId: json["bookCategoryId"],
        bookList: bookList);
  }
}

class BookListDTO {
  final int bookId;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BookListDTO(
      {required this.bookId,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

  BookListDTO.fromJson(Map<String, dynamic> json)
      : bookId = json["bookId"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

/// 2. 창고
class OneMonthPressBookListViewModel
    extends StateNotifier<OneMonthPressBookListModel?> {
  OneMonthPressBookListViewModel(super._state, this.ref);

  Ref ref;

  Future<OneMonthPressBookListModel> notifyInit(
      BookMonthReqDTO bookMonthReqDTO) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchMonthBookList(bookMonthReqDTO);
    OneMonthPressBookListModel model = responseDTO.data;
    state = OneMonthPressBookListModel(
        bookCategoryId: model.bookCategoryId,
        bookCount: model.bookCount,
        bookList: model.bookList);
    Logger().d("상태 : ${state?.bookCategoryId}");
    Logger().d("상태 : ${state?.bookCount}");
    Logger().d("상태 : ${state?.bookList}");

    return OneMonthPressBookListModel(
        bookCount: model.bookCount,
        bookCategoryId: model.bookCategoryId,
        bookList: model.bookList);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final oneMonthPressProvider = StateNotifierProvider.family<
    OneMonthPressBookListViewModel,
    OneMonthPressBookListModel?,
    BookMonthReqDTO>((ref, bookMonthReqDTO) {
  return OneMonthPressBookListViewModel(null, ref)..notifyInit(bookMonthReqDTO);
});
