import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_sub_scription_list_page/widgets/form/my_setting_sub_scription_form.dart';

class MySettingSubScriptionListBody extends StatelessWidget {
  const MySettingSubScriptionListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          Text("전체 내역 (1개)", style: subTitle2()),
          const SizedBox(height: gapLarge),
          MySettingSubSciptionForm(
            startDuration: "2021.06.18",
            endDuration: "2023.08.16",
            paymentDate: "2023.07.16",
            price: "9,900",
            payment: "9,900",
          ),
        ],
      ),
    );
  }
}
