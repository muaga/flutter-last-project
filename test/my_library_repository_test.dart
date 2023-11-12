import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/my_library_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  // await fetch(BookRequestDTO(bookCategowryId: 1, alignment: "ranking"));
  await notifyInit(1);
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

Future<void> notifyInit(int userId) async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAxMjE4NTd9.CGja8EcO7NVAd5iWXUPSMq5Pnne6j54on_Dl9Kc4dloz9nOibTLFyoISLj_embkOeMDRmD2ur9gdkgH4wD2awQ";
  int userId = 1;

  ResponseDTO responseDTO =
  await MyLibraryRepository().fetchMyLibraryInfo(jwt);
  MyLibraryMainModel? model = responseDTO.data;
  Logger().d(model);
}
