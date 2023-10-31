import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_profile_page/widgets/body/my_setting_profile_body.dart';

class MySettingProfilePage extends StatelessWidget {
  const MySettingProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("개인정보수정"),
        leading: IconButton(
            icon: iconArrowBack(),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.5,
      ),
      body: MySettingProfileBody(),
    );
  }
}
