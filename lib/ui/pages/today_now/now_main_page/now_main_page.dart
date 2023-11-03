import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/body/now_main_body.dart';

class NowMainPage extends StatelessWidget {
  const NowMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NowMainBody(),
    );
  }
}
