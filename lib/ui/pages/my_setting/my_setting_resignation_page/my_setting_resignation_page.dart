import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/body/my_setting_resignation_body.dart';

class MySettingResignationPage extends StatelessWidget {
  const MySettingResignationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("회원탈퇴"),
      ),
      body: MySettingResignationBody(),
    );
  }
}
