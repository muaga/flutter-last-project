import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/view_model/book_read_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch();
}

/// TODO : 통신 테스트
Future<void> fetch() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAzNjY1OTR9.VdqjdU8Mj-RV6NCfKn8VmArqikOnA5jLfNCLk434sCzlkrUgG3x5nhaggCsaHbFpQKSO3k8oGVRv9Dn6L1K3bg";
  Response<dynamic> response = await dio.get("/readingbook/2",
      options: Options(headers: {"Authorization": jwt}));
  // Logger().d(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

  // Logger().d(responseDTO.data);
  // Logger().d(responseDTO.msg);
  // Logger().d(responseDTO.data);
  //
  BookReadModel model = BookReadModel.fromJson(responseDTO.data);
  // //
  Logger().d(model.bookMarkDTOList);
  Logger().d(model.bookdata);
  // List<String> bookDataList = model.bookdata;
  // for (String bookData in bookDataList) {
  //   Logger().d("page : ${bookData}");
  // }
  // Logger().d(responseDTO.data);
}
