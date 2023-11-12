import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view_model/one_month_press_book_list_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  // await fetch(BookRequestDTO(bookCategowryId: 1, alignment: "ranking"));
  await notifyInit(BookReqDTO(bookCategoryId: 0, alignment: "ranking"));
}

/// TODO : 통신 테스트
// Future<void> fetch(BookRequestDTO dto) async {
//   Response<dynamic> response =
//   await dio.post("/book/detail/1", data: dto.toJson());
//   Logger().d(response.headers);
//   // Logger().d(response.data);
//   //
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   Logger().d(responseDTO.code);
//   // Logger().d(responseDTO.msg);
//   Logger().d(responseDTO.data);
// }
// OneMonthPressBookListModel model =
//
// Logger().d(model.bookLike);
// Logger().d(model.bookDetailReplyList[0]);
// Logger().d(model.bookDetailReplyList[1]);
// Logger().d(model.bookDetailReplyList[2]);
// Logger().d(model.bookId);

// 책 한달 이내 출간된 책 목록보기
Future<void> fetchBookMonthList(BookReqDTO bookReqDTO) async {
  // 통신
  Response<dynamic> response =
      await dio.post("/book/monthList", data: bookReqDTO.toJson());
  // Logger().d(response);

  // 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d(responseDTO);

  OneMonthPressBookListModel model =
      OneMonthPressBookListModel.fromJson(responseDTO.data);
  List<BookListDTO>? bookList = model.bookList;

  for (BookListDTO book in bookList!) {
    Logger().d(book.bookTitle);
  }
}

Future<void> notifyInit(BookReqDTO bookReqDTO) async {
  ResponseDTO responseDTO =
      await BookRepository().fetchBookMonthList(bookReqDTO);
  OneMonthPressBookListModel model = responseDTO.data;
  OneMonthPressBookListModel(
      bookCount: model.bookCount,
      bookCategoryId: model.bookCategoryId,
      bookList: model.bookList);
  Logger().d("실행완료");
  Logger().d(model.bookCategoryId);
}
