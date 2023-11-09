import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:logger/logger.dart';

class paymentRepository {
  Future<ResponseDTO> fetchPayment(PaymentRequestDTO dto) async {
    try {
      Response response = await dio.post(
        "/payment/result",
        data: dto.toJson(),
      );
      // options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      Logger().d("dio 통신 되? ${e.toString()}");
      return new ResponseDTO(-1, "통신실패", null);
    }
  }
}
