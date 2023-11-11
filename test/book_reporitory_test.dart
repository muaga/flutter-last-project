import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/widgets/view_model/search_category_book_list_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  // await fetch(BookRequestDTO(bookCategowryId: 1, alignment: "ranking"));
  await notifyInit(BookCategoryReqDTO(
      bookCategoryId: 1, alignment: "ranking", minusMonths: 12));
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

Future<void> fetch() async {
  try {
    final response = await dio.get("/book/detail/1");
    Logger().d(response.data);
    // BookDetailModel model = BookDetailModel.fromJson(response.data);
  } catch (e) {}
}

// BookCategory category = BookCategory.fromJson(model.bookCategory);
// Logger().d(responseDTO.code);
// Logger().d(responseDTO.data);
//   List<dynamic> mapList = responseDTO.data as List<dynamic>;
//   Logger().d(mapList);
//   List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();
//   responseDTO.data = bookList;}

Future<void> notifyInit(BookCategoryReqDTO bookCategoryReqDTO) async {
  ResponseDTO responseDTO =
      await BookRepository().fetchCategoryBookList(bookCategoryReqDTO);
  SearchCategoryBookListModel model = responseDTO.data;

  Logger().d(model);
  Logger().d(model.bookCategoryId);
  Logger().d(model.byCategoryPages);
  Logger().d(model.bookCount);
}
