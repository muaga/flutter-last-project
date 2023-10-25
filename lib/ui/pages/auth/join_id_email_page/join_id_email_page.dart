import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/auth/join_id_email_page/widgets/body/join_id_email_body.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_button.dart';

class JoinIdEmailPage extends StatelessWidget {
  const JoinIdEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: kFontLightGray)),
        title: Text("회원가입"),
        elevation: 0.2,
      ),
      body: JoinIdEmailBody(),
      extendBody: true,
      bottomNavigationBar: BottomButton(),
    );
  }
}
