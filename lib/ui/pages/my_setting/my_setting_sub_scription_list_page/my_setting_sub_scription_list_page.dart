import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';

import 'widgets/body/my_setting_sub_scription_list_body.dart';

class MySettingSubScriptionListPage extends StatelessWidget {
  const MySettingSubScriptionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: iconArrowBack(),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("구독 내역 확인"),
        elevation: 0.5,
      ),
      body: MySettingSubScriptionListBody(subScriptionState: true),
    );
  }
}
