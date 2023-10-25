import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/auth/join_password_page/widgets/body/join_password_body.dart';

class JoinPasswordPage extends StatelessWidget {
  const JoinPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: kFontLightGray)),
        title: Text("비밀번호 등록"),
        elevation: 0.2,
      ),
      resizeToAvoidBottomInset: false,
      body: JoinPasswordBody(),
    );
  }
}
