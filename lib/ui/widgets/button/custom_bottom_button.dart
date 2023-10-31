import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomBottomButton extends StatelessWidget {
  final funPageRoute;
  final String buttonText;
  const CustomBottomButton(
      {required this.funPageRoute, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funPageRoute,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), // 버튼 색상
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      child: Text(
        buttonText,
        style: subTitle1(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_blog/_core/constants/color.dart';
// import 'package:flutter_blog/ui/widgets/button/custom_checkBox.dart';
// import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
//
// class CheckBoxForm extends StatelessWidget {
//   const CheckBoxForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: double.infinity, // 레이아웃의 가로 공간을 다 사용
//           height: 250.0, // 원하는 높이
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: kBackGray, width: 1.0),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CheckboxExample(),
//                     Text('전체 동의하기'),
//                   ],
//                 ),
//                 CustomThinLine(),
//                 Row(
//                   children: [
//                     CheckboxExample(),
//                     Text('(필수) 만14세 이상'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CheckboxExample(),
//                     Text('(필수) 밀리의 서재 이용약관 동의'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CheckboxExample(),
//                     Text('(필수) 개인정보 처리방침 동의'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CheckboxExample(),
//                     Text('(선택) 도서추천, 신간도식 등 알림 수신'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
