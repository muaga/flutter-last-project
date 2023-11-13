import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/my_library_requset_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';

class MyLibraryRepository {
  // 피드 전체 post 목록
  Future<ResponseDTO> fetchMyLibraryInfo(String jwt) async {
    try {
      // 1. 통신
      Response response = await dio.get("/myLibraryMain",
          options: Options(headers: {"Authorization": jwt}));

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      MyLibraryMainModel model = MyLibraryMainModel.fromJson(responseDTO.data);
      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "내 서재 불러오기 실패", null);
    }
  }
}
