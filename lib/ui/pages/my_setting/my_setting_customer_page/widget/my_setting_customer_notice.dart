import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MySettingCustomerNotice extends StatefulWidget {
  final noticeTitle;
  final noticeDate;
  final noticeComent;

  const MySettingCustomerNotice({
    required this.noticeTitle, required this.noticeDate, required this.noticeComent
  });

  @override
  State<MySettingCustomerNotice> createState() => _MySettingCustomerNoticeState();

}

class _MySettingCustomerNoticeState extends State<MySettingCustomerNotice> {
  bool isExpanded = false; // isExpanded 변수를 정의하고 초기값을 false로 설정

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded; // toggleExpansion 메서드를 정의하여 isExpanded 변수를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            toggleExpansion(); // 컨테이너를 탭하면 확장/축소 토글
          },
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 가로 정렬을 왼쪽으로 설정
              children: [
                SizedBox(height: gapLarge),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black, // 테두리 색상 설정
                      width: 2.0, // 테두리 두께 설정
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: gapSmall, vertical: 3),
                    child: Text("공지"),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 가로 정렬을 왼쪽으로 설정
                    children: [
                      Text(widget.noticeTitle, style: title1()),
                      SizedBox(height: gapSmall),
                      Text(widget.noticeDate, style: body2(mColor: kFontGray)),
                      SizedBox(height: gapLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            child: Column(
              children: [
                Text(widget.noticeComent, style: body1()),
                CustomThinLine(),
              ],
            ),
          ),
      ],
    );
  }
}
