import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_main_page/widgets/my_setting_main_body.dart';

class MySettingMainPage extends StatelessWidget {
  const MySettingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MySettingMainBody(),
    );
  }
}
