import 'package:flutter_blog/data/dto/request_dto/book_mark_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_mark_repository.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/view_model/book_read_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAzNjY1OTR9.VdqjdU8Mj-RV6NCfKn8VmArqikOnA5jLfNCLk434sCzlkrUgG3x5nhaggCsaHbFpQKSO3k8oGVRv9Dn6L1K3bg";
  BookMarkReqDTO bookMarkReqDTO =
      BookMarkReqDTO(userId: 1, bookId: 2, scroll: 2);

  await bookMark(bookMarkReqDTO, jwt);
}

// 페이지 북마크 등록 및 삭제
Future<void> bookMark(BookMarkReqDTO bookMarkReqDTO, String jwt) async {
  ResponseDTO responseDTO =
      await BookMarkRepository().fetchBookMark(bookMarkReqDTO, jwt);
  Logger().d(responseDTO.data);
  BookMarkDTO bookMark = responseDTO.data;
  Logger().d(bookMark.bookMark);
}
