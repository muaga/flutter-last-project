import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/view_model/post_detail_page_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDA0NjUyMzl9.7ZGbEjc3WxdDw-9EVRts83uD-1k5FtqDfZzrruG1ss3_hv5hYXoq6WDRH9CmqiJPs1ZqrM1LJ1enIAAlp80Oig";

  await fetchPost(jwt, 1);
}

// TODO : 통신 테스트

// Future<void> fetchDeletePost(String jwt, int boardId) async {
//   Response response = await dio.delete("/board/${boardId}/delete",
//       options: Options(headers: {"Authorization": jwt}));
//   Logger().d("응답 : $response");
//
//   // 응답 받은 데이터 파싱
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   // Logger().d("응답 : $response.");
//
//   // responseDTO.data = Post.fromJson(responseDTO.data);
// }

Future<ResponseDTO> fetchPost(String jwt, int id) async {
  try {
    // 통신
    Response response = await dio.get("/boardDetail/$id",
        options: Options(headers: {"Authorization": jwt}));

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    PostDetailModel model = PostDetailModel.fromJson(responseDTO.data);
    Logger().d(responseDTO);
    Logger().d(model.boardUserNickname);
    responseDTO.data = model;

    return responseDTO;
  } catch (e) {
    return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
  }
}
