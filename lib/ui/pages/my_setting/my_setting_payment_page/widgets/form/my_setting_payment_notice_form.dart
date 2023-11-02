import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_payment_page/widgets/my_setting_payment_notice.dart';

class MySettingPaymentNoticeForm extends StatelessWidget {
  const MySettingPaymentNoticeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("App Store 구매 안내", style: subTitle3()),
      MySettingPaymentNotice()
    ]);
  }
}
