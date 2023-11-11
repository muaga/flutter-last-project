import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/post_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/widgets/feed_main_view_model.dart';
import 'package:logger/logger.dart';

void main() async {
  // await fetch(PostSaveReqDTO(
  //     boardTitle: "추천합니다", content: "이 글 너무 좋아여", userId: 1, bookId: 1));

  await notifyInit();
}

/// TODO : 통신 테스트
Future<void> fetch(PostSaveReqDTO dto) async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAxMjE4NTd9.CGja8EcO7NVAd5iWXUPSMq5Pnne6j54on_Dl9Kc4dloz9nOibTLFyoISLj_embkOeMDRmD2ur9gdkgH4wD2awQ";
  Response response = await dio.post("/board/save",
      data: dto.toJson(), options: Options(headers: {"Authorization": jwt}));
  Logger().d(response.data);
}

Future<void> fetchPostList() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAxMjE4NTd9.CGja8EcO7NVAd5iWXUPSMq5Pnne6j54on_Dl9Kc4dloz9nOibTLFyoISLj_embkOeMDRmD2ur9gdkgH4wD2awQ";
  Response response = await dio.get("/boardList",
      options: Options(headers: {"Authorization": jwt}));
  // Logger().d(response.data);

  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // Logger().d(responseDTO.data);

  FeedMainModel model = FeedMainModel.fromJson(responseDTO.data);
  List<BoardDTO> boardList = model.boardList;
  for (BoardDTO board in boardList) {
    Logger().d(board.bookId);
  }
}

Future<void> notifyInit() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE3MDAxMjE4NTd9.CGja8EcO7NVAd5iWXUPSMq5Pnne6j54on_Dl9Kc4dloz9nOibTLFyoISLj_embkOeMDRmD2ur9gdkgH4wD2awQ";
  ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);
  // Logger().d("responseDTO : ${responseDTO}");
  FeedMainModel model = responseDTO.data;
  Logger().d("model : ${model.boardList[0].boardTitle}");
}
