/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/paymentRepository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:logger/logger.dart';

class PayHomePage extends ConsumerWidget {
  final int price;
  final String name;
  const PayHomePage({Key? key, required this.price, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser session = ref.read(sessionStore);

    return IamportPayment(
      appBar: new AppBar(
        title: new Text('구독권 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp68074630',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'kakaopay', // PG사
        payMethod: 'card', // 결제수단
        name: name, // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: price, // 결제금액
        buyerName: "${session.user!.nickname}", // 구매자 이름
        buyerTel: '01012345678', // 구매자 연락처
        buyerEmail: "${session.user!.email}", // 구매자 이메일
        appScheme: 'example', // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        if (result['imp_success'] == 'true') {
          PaymentReqDTO requestDTO =
              PaymentReqDTO(userId: session.user!.id, pay: name);
          Logger().d("requestDTO.userId  ${requestDTO.userId}");
          ResponseDTO responseDTO =
              await paymentRepository().fetchPayment(requestDTO);
          Logger().d("requestDTO.userId  ${responseDTO.code}");
          if (responseDTO.code == 1) {
            return AlertDialog(content: Text("결제 완료"));
          } else {
            return AlertDialog(content: Text("결제는 완료, 서버 통신 실패"));
          }
          //서버에 실패했다는 alert창 띄우기
        } else {
          //결제에 실패했다는 alert 창 띄우기
          Navigator.pushReplacementNamed(
            context,
            '/cookieShop',
            arguments: result,
          );
        }
      },
    );
  }
}
