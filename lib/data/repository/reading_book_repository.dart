import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';

class ReadingBookRepository {
  // 책 내용 상세보기
  Future<ResponseDTO> fetchReadingBookDelete(int id, String jwt) async {
    try {
      // 통신
      Response response = await dio.get(
        "/readingbook/${id}/delete",
        options: Options(headers: {"Authorization": jwt}),
      );

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 내용 불러오기 실패", null);
    }
  }
}
