import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';

class MysettingsubScriptionBody extends StatelessWidget {
  const MysettingsubScriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAndForwordForm(
            title: "결재 내역 확인",
            funPageRoute: () {
              Navigator.pushNamed(context, "/mySettingSubScriptionList");
            }),
        CustomTitleAndForwordForm(title: "결제 해지 신청", funPageRoute: () {}),
        CustomTitleAndForwordForm(title: "결제 관리", funPageRoute: () {}),
      ],
    );
  }
}
