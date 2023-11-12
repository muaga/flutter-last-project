import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 데이터
class OneMonthPressBookListModel {
  final int bookCount;
  final int bookCategoryId;
  final List<BookListDTO>? bookList;
  OneMonthPressBookListModel(
      {required this.bookCount, required this.bookCategoryId, this.bookList});

  factory OneMonthPressBookListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["bookList"];
    List<BookListDTO> boardList =
        temp.map((e) => BookListDTO.fromJson(e)).toList();

    return OneMonthPressBookListModel(
        bookCount: json["bookCount"],
        bookCategoryId: json["bookCategoryId"],
        bookList: boardList);
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
  OneMonthPressBookListViewModel(super._state);

  // 통신을 통해 reponseDTO에 데이터 받아오고 최초 상태 변경하기
  Future<void> notifyInit(BookReqDTO bookReqDTO) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchBookMonthList(bookReqDTO);
    OneMonthPressBookListModel model = responseDTO.data;
    state = OneMonthPressBookListModel(
        bookCount: model.bookCount,
        bookCategoryId: model.bookCategoryId,
        bookList: model.bookList);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final oneMonthPressBookListProvider = StateNotifierProvider.family<
    OneMonthPressBookListViewModel,
    OneMonthPressBookListModel?,
    BookReqDTO>((ref, bookReqDTO) {
  return OneMonthPressBookListViewModel(null)..notifyInit(bookReqDTO);
});
