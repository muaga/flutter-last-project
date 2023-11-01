import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/form/my_setting_sub_scription_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/form/my_setting_sub_scription_refund_form.dart';

class MySettingSubScriptionListBody extends StatelessWidget {
  const MySettingSubScriptionListBody(
      {super.key, required this.subScriptionState});

  final subScriptionState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO 은혜 : 결제 내역 받아오기
          Text("전체 내역 (1개)", style: subTitle2()),
          const SizedBox(height: gapLarge),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                if (subScriptionState == true) {
                  return MySettingSubSciptionForm(
                      startDuration: "2021.06.18",
                      endDuration: "2023.08.16",
                      paymentDate: "2023.07.16",
                      price: "9,900",
                      payment: "9,900",
                      subScriptionNumber: "I2021061811245675420");
                } else {
                  return MySettingSubSciptionReFundForm(
                    price: "9,900",
                    reFundDate: "2023.08.18",
                    reFund: "9,900",
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
