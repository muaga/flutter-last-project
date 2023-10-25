import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/form/login_text_form.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_out_line_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: iconArrowBack()),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("독서와 무제한 친해지리", style: title1()),
            SizedBox(height: gapSmall),
            Text("즐거운 독서 생활로 당신의 일상을 1밀리+", style: subTitle2()),
            SizedBox(height: gapLarge),
            LoginTextForm(),
            SizedBox(height: gapLarge),
            _buildAccounManagement(),
            SizedBox(height: gapXlarge),
            // SimpleLoginList(),
          ],
        ),
      ),
    );
  }

  Row _buildAccounManagement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildColumnLine(),
      ],
    );
  }

  Row _buildAnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Expanded(child: _buildRowLine()), // Line 화면 가로에 맞춰 width 자동 지정
        // SizedBox(width: gapMedium),
        // _buildLineText(),
        // SizedBox(width: gapMedium),
        // Expanded(child: _buildRowLine()),
      ],
    );
  }

  Container _buildColumnLine() {
    return Container(
      height: 15,
      width: 1.0,
      color: kBackGray,
    );
  }
}
