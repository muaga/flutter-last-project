import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MySettingSubRadioButton extends StatefulWidget {
  MySettingSubRadioButton({
    super.key,
    this.selectedValue,
    required this.selectedBoxNum,
    required this.unSelectedBoxNum,
    required this.tagText,
    this.tagBoxColor,
    this.tagBorderColor,
    this.tagFontColor,
    required this.onChanged,
  });

  int? selectedValue;
  int selectedBoxNum;
  int unSelectedBoxNum;
  String tagText;
  Color? tagBoxColor;
  Color? tagBorderColor;
  Color? tagFontColor;
  final ValueChanged<int?> onChanged;

  @override
  State<MySettingSubRadioButton> createState() =>
      _MySettingSubRadioButtonState();
}

class _MySettingSubRadioButtonState extends State<MySettingSubRadioButton> {
  List<String> subs = ["￦11,900/월", "￦119,000/연"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 170,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kBackLight2Gray, // 그림자 색상
                offset: Offset(0, 1), // 그림자의 위치 (X, Y)
                blurRadius: 5.0, // 그림자의 흐림 정도
                spreadRadius: 1.0 // 그림자의 확산 정도
                ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: widget.selectedValue == widget.selectedBoxNum
                  ? kPrimaryColor
                  : Colors.transparent,
              style: BorderStyle.solid,
              width: 6)),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            Radio(
              activeColor: kPrimaryColor,
              value: widget.selectedBoxNum,
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.onChanged(value);
                });
              },
            ),
            Text(subs[widget.selectedBoxNum], style: subTitle1()),
            const SizedBox(height: gapLarge),
            Container(
              decoration: BoxDecoration(
                color: widget.tagBoxColor ?? Colors.transparent,
                border: Border.all(color: widget.tagBorderColor ?? kBackGray),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              child: Text("${widget.tagText}",
                  style: body3(mColor: widget.tagFontColor ?? kFontGray)),
            )
          ],
        ),
      ),
    );
  }
}
