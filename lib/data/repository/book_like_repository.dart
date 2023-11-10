// 통신 & 파싱

import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_like_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book_like.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';

class BookLikeRepository {
  Future<ResponseDTO> fetchBookLikeWrite(
      BookLikeReqDTO requestDTO, String jwt) async {
    try {
      /// TODO 은혜 :  서버 엔드포인트 넣기 -> 내부 메소드 수정
      Response response = await dio.post("/bookLike/check",
          options: Options(headers: {"Authorization": "$jwt"}),
          data: requestDTO.toJson());

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      BookLikeDTO bookLikeDTO = BookLikeDTO.fromJson(responseDTO.data);
      responseDTO.data = bookLikeDTO;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "북마크 등록 실패", null);
    }
  }
}
