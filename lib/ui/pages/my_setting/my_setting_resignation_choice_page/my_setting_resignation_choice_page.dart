import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_resignation_page/widgets/my_setting_resignation_two_button.dart';
import 'package:logger/logger.dart';

class MySettingResignationChoicePage extends StatefulWidget {
  final int userId;

  const MySettingResignationChoicePage({super.key, required this.userId});

  @override
  State<MySettingResignationChoicePage> createState() =>
      _MySettingResignationChoicePageState();
}

class _MySettingResignationChoicePageState
    extends State<MySettingResignationChoicePage> {
  @override
  Widget build(BuildContext context) {
    List<String> reason = [
      "자주 사용하지 않아서",
      "도서 컨텐츠가 부족해서",
      "잦은 시스템 오류 때문에",
      "전반적으로 이용이 어려워서",
      "구독 요금이 비싸서",
      "개인정보 및 보안 우려 때문에",
      "다른 아이디로 가입하고자",
    ];
    String? selectedReason;

    // TODO 은혜 : int? selectedreasonId; => 사유를 id로 날릴 경우 사용

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("회원탈퇴"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("서재 이용 현황", style: subTitle2()),
            SizedBox(height: gapMedium),
            Expanded(
              child: ListView.builder(
                itemCount: reason.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${reason[index]}'),
                    leading: Radio(
                      value: reason[index],
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value!;
                          // selectedreasonId = index;
                          Logger().d("value : ${selectedReason}");
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: gapXlarge),
            MySettingResignationTwoButton(
              funPageRoute: () {
                Navigator.popAndPushNamed(context, "/loginJoin");
              },
            ),
          ],
        ),
      ),
    );
  }
}
