import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/post_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/view_model/post_detail_page_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_update_page/widgets/post_update_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/post_write_view_model.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/widgets/feed_main_view_model.dart';
import 'package:logger/logger.dart';

class PostRepository {
  // 피드 전체 post 목록
  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      // 1. 통신
      Response response = await dio.get("/boardList",
          options: Options(headers: {"Authorization": jwt}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      FeedMainModel model = FeedMainModel.fromJson(responseDTO.data);

      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 목록 불러오기 실패", null);
    }
  }

  // deletePost, updatePost, savePost
  // fetchPos, fetchPostList
  Future<ResponseDTO> fetchSavePost(
      String jwt, PostSaveReqDTO postSaveReqDTO) async {
    try {
      // 1. 통신
      final response = await dio.post("/board/save",
          data: postSaveReqDTO.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      PostWriteModel model = PostWriteModel.fromJson(responseDTO.data);

      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 작성 실패", null);
    }
  }

  //수정
  Future<ResponseDTO> fetchUpdatePost(
      String jwt, PostUpdateReqDTO postUpdateReqDTO) async {
    try {
      // 1. 통신
      final response = await dio.post("/board/1/update",
          data: postUpdateReqDTO.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      PostUpdateModel model = PostUpdateModel.fromJson(responseDTO.data);

      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 수정 실패", null);
    }
  }

  Future<ResponseDTO> fetchPost(String jwt, int id) async {
    try {
      // 통신
      Response response = await dio.get("/boardDetail/$id",
          options: Options(headers: {"Authorization": jwt}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      PostDetailModel model = PostDetailModel.fromJson(responseDTO.data);
      Logger().d(model.boardUserNickname);
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
    }
  }

  Future<ResponseDTO> fetchDeletePost(String jwt, int boardId) async {
    try {
      // 통신
      Response response = await dio.delete("/board/${boardId}/delete",
          options: Options(headers: {"Authorization": jwt}));
      Logger().d("응답 : $response");

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = Post.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "게시글 삭제 실패", null);
    }
  }
}
