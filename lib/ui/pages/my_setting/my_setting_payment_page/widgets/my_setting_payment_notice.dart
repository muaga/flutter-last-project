import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MySettingPaymentNotice extends StatelessWidget {
  const MySettingPaymentNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("· App Store 결제는 현재 사용하고 있는 App Store 계정을 통해 결제됩니다.",
              style: body4()),
          SizedBox(height: gapSmall),
          Text("· 일부 사용자의 경우, App Store 상황에 따라 구독 마지막 날 결제될 수 있습니다.",
              style: body4()),
          SizedBox(height: gapSmall),
          Text("· 상품 이용 중 상품의 변경, 환불 처리는 Apple의 정책에 따릅니다. 자세한 사항은 이 링크를 확인하세요",
              style: body4()),
        ],
      ),
    );
  }
}
