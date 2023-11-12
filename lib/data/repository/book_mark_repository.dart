import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_mark_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';

// 보류
class BookMarkRepository {
  Future<ResponseDTO> fetchBookMark(
      BookMarkReqDTO requestDTO, String jwt) async {
    try {
      Response response = await dio.post("/bookBark/check",
          options: Options(headers: {"Authorization": "$jwt"}),
          data: requestDTO.toJson());

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "북마크 등록 실패", null);
    }
  }
}
