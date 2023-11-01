import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class CheckBoxGroup extends StatefulWidget {
  @override
  _CheckBoxGroupState createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckBoxGroup> {
  bool isAllChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  void updateAllCheckBox(bool? newValue) {
    if (newValue != null) {
      setState(() {
        isAllChecked = newValue;
        isChecked1 = newValue;
        isChecked2 = newValue;
        isChecked3 = newValue;
        isChecked4 = newValue;
        isChecked5 = newValue;
      });
    }
  }

  void updateSubCheckBox(int index, bool newValue) {
    setState(() {
      switch (index) {
        case 0:
          isChecked1 = newValue;
          break;
        case 1:
          isChecked2 = newValue;
          break;
        case 2:
          isChecked3 = newValue;
          break;
        case 3:
          isChecked4 = newValue;
          break;
        case 4:
          isChecked5 = newValue;
          break;
      }
      isAllChecked =
          isChecked1 && isChecked2 && isChecked3 && isChecked4 && isChecked5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: double.infinity, // 레이아웃의 가로 공간을 다 사용
          height: 250.0, // 원하는 높이
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBackGray, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isAllChecked,
                        onChanged: updateAllCheckBox,
                      ),
                      Text('전체 동의하기'),
                    ],
                  ),
                  CustomThinLine(),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked1 ?? false,
                        onChanged: (value) {
                          updateSubCheckBox(0, value ?? false);
                        },
                        activeColor: kPrimaryColor,
                      ),
                      Text('(필수) 만14세 이상'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        onChanged: (value) {
                          updateSubCheckBox(1, value ?? false);
                        },
                      ),
                      Text('(필수) 밀리의 서재 이용약관 동의'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (value) {
                          updateSubCheckBox(2, value ?? false);
                        },
                      ),
                      Text('(필수) 개인정보 처리방침 동의'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked4,
                        onChanged: (value) {
                          updateSubCheckBox(3, value ?? false);
                        },
                      ),
                      Text('(선택) 도서추천, 신간도식 등 알림 수신'),
                    ],
                  ),
                ],
              )))
    ]);
  }
}
