// V -> P(전역프로바이더, 뷰모델) -> R
import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_reply_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_view_model.dart';
import 'package:logger/logger.dart';

class BookReplyRepository {
  /// TODO 패치부분 수정
  Future<ResponseDTO> fetchBookReplyList(String jwt, int bookId) async {
    try {
      // 1. 통신
      final response = await dio.get("/book/$bookId/bookReply",
          options: Options(headers: {"Authorization": "$jwt"}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      BookReplyListModel model = BookReplyListModel.fromJson(responseDTO.data);

      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "댓글 목록 불러오기 실패", null);
    }
  }

  // deletePost, updatePost, savePost
  // fetchPos, fetchPostList
  Future<ResponseDTO> fetchBookReplyWrite(
      String jwt, BookReplyWriteReqDTO dto) async {
    try {
      // 1. 통신
      final response = await dio.post("/bookReply/save",
          data: dto.toJson(),
          options: Options(headers: {"Authorization": "$jwt"}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      SaveReplyDTO saveReplyDTO = SaveReplyDTO.fromJson(responseDTO.data);

      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
      responseDTO.data = saveReplyDTO;

      //
      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "댓글 작성 실패", null);
    }
  }

  Future<ResponseDTO> fetchBookReply(String jwt, int id) async {
    try {
      // 통신
      Response response = await dio.get("/book/detail/$id",
          options: Options(headers: {"Authorization": "$jwt"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = BookReply.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
    }
  }

  /// 책 댓글 삭제
  Future<ResponseDTO> fetchDeleteReply(String jwt, int replyId) async {
    try {
      // 통신
      Response response = await dio.delete("/bookReply/${replyId}/delete",
          options: Options(headers: {"Authorization": "$jwt"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "댓글 삭제 실패", null);
    }
  }
}
