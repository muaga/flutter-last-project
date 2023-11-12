import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view_model/one_month_press_book_list_view_model.dart';

// 통신 & 파싱
class BookRepository {
  // 책 상세보기
  Future<ResponseDTO> fetchBookDetail(int bookId, String jwt) async {
    try {
      // 통신
      Response response = await dio.get(
        "/book/detail/$bookId",
        options: Options(headers: {"Authorization": jwt}),
      );

      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      BookDetailModel book = BookDetailModel.fromJson(responseDTO.data);
      responseDTO.data = book;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 한건 불러오기 실패", null);
    }
  }

  // 책 한달 이내 출간된 책 목록보기
  Future<ResponseDTO> fetchBookMonthList(BookReqDTO bookReqDTO) async {
    try {
      // 통신
      Response<dynamic> response =
          await dio.post("/book/monthList", data: bookReqDTO.toJson());
      // 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      OneMonthPressBookListModel model =
          OneMonthPressBookListModel.fromJson(responseDTO.data);

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }
}
