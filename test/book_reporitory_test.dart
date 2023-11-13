import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAzNjY1OTR9.VdqjdU8Mj-RV6NCfKn8VmArqikOnA5jLfNCLk434sCzlkrUgG3x5nhaggCsaHbFpQKSO3k8oGVRv9Dn6L1K3bg";

  await fetchBookDetail(1, jwt);
}

Future<void> fetchBookDetail(int bookId, String jwt) async {
  // 통신
  Response response = await dio.get(
    "/book/detail/$bookId",
    options: Options(headers: {"Authorization": jwt}),
  );

  Logger().d(response.data);

  // 파싱
  // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // BookDetailModel book = BookDetailModel.fromJson(responseDTO.data);
  // responseDTO.data = book;
}
