import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:logger/logger.dart';

class MySettingResignationChoiceRadioButton extends StatefulWidget {
  const MySettingResignationChoiceRadioButton({super.key});

  @override
  State<MySettingResignationChoiceRadioButton> createState() =>
      _MySettingResignationChoiceRadioButtonState();
}

class _MySettingResignationChoiceRadioButtonState
    extends State<MySettingResignationChoiceRadioButton> {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reason.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${reason[index]}'),
          leading: Radio(
            activeColor: kPointColor,
            value: reason[index], // 값정하기 (첫번째 1)
            groupValue: selectedReason ?? "", //선택된 레디오에 색칠하기
            onChanged: (value) {
              setState(() {
                print("value : ${value}");
                selectedReason = value!;
                // selectedreasonId = index;
                Logger().d("value : ${selectedReason}");
              });
            },
          ),
        );
      },
    );
  }
}
