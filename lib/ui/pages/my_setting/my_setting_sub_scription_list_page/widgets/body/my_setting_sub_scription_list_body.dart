import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/form/my_setting_sub_scription_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/form/my_setting_sub_scription_refund_form.dart';

class MySettingSubScriptionListBody extends StatelessWidget {
  MySettingSubScriptionListBody({super.key});

  List<bool> subScriptionState = [true, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO 은혜 : 결제 내역 받아오기
          Text("전체 내역 (${subScriptionState.length}개)", style: subTitle2()),
          Expanded(
            child: ListView.builder(
              itemCount: subScriptionState.length,
              itemBuilder: (context, index) {
                if (subScriptionState[index] == true) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: gapMain),
                    child: MySettingSubSciptionForm(
                        startDuration: "2023.11.14",
                        endDuration: "2023.12.13",
                        paymentDate: "2023.12.13",
                        price: "9,900",
                        payment: "9,900",
                        subScriptionNumber: "I2021061811245675420"),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: gapMain),
                    child: MySettingSubSciptionReFundForm(
                      price: "9,900",
                      reFundDate: "2023.08.18",
                      reFund: "9,900",
                    ),
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
