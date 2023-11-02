import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_notice.dart';

class MySettingResignationNoticeForm extends StatelessWidget {
  const MySettingResignationNoticeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("탈퇴 회원 유의 사항", style: subTitle3(mColor: kFontRed)),
      MySettingResignationNotice()
    ]);
  }
}
