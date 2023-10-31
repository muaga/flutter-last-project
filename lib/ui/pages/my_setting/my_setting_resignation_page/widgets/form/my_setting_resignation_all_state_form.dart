import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_state.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MySettingResignationAllStateForm extends StatelessWidget {
  const MySettingResignationAllStateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBackGray),
      ),
      child: Padding(
        padding: EdgeInsets.all(gapMain),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.username}의 서재",
                style: subTitle2(),
              ),
              Padding(
                  padding: EdgeInsets.only(top: gapMain, bottom: gapMain),
                  child: CustomThinLine()),

              // TODO 은혜 : 해당 유저의 좋아요 도서, 작성한 포스트 갯수 가져오기
              MySettingResignationState(
                  title: "서재에 기록된 도서", quantity: 48, unit: "권"),
              SizedBox(height: gapMain),
              MySettingResignationState(
                  title: "서재에 기록된 포스트", quantity: 1, unit: "개")
            ],
          ),
        ),
      ),
    );
  }
}
