import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';

import 'widgets/body/my_setting_sub_scription_body.dart';

class MySettingSubScriptionPage extends StatelessWidget {
  const MySettingSubScriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: iconArrowBack(),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("구독 관리"),
        elevation: 0.5,
      ),
      body: MysettingsubScriptionBody(),
    );
  }
}
