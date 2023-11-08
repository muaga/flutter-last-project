import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_view_model.dart';

class BookDataRepository {
  // 책 내용 상세보기
  Future<ResponseDTO> fetchBookDataDetail(int id, String jwt) async {
    try {
      // 통신
      Response response = await dio.post(
        "/readingbook/${id}",
        options: Options(headers: {"Authorization": jwt}),
      );

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      BookReadModel bookData = BookReadModel.fromJson(responseDTO.data);
      responseDTO.data = bookData;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 내용 불러오기 실패", null);
    }
  }
}
