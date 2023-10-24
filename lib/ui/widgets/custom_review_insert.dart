import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomReviewInsert extends StatelessWidget {
  const CustomReviewInsert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: gapMedium),
            child: Container(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/user_images/avatar.png"),
              ),
            ),
          ),
          SizedBox(width: gapMedium),
          Expanded(
            child: Stack(
              children: [
                TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: "다양한 생각을 남겨주세요", // 힌트 텍스트를 비웁니다
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.newline,
                  maxLines: null, // 다중 라인 입력을 가능하게 합니다.
                  maxLength: 50, // 최대 글자 수를 50자로 제한
                ),
                Positioned(
                  top: 5,
                  left: 12,
                  child: Text(
                    "한 줄 리뷰",
                    style: body2(mColor: kFontGray),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Container(
            height: 58,
            child: TextButton(
              onPressed: () {
                // 리뷰를 제출하는 로직을 추가하세요.
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey, // 원하는 배경색으로 변경
              ),
              child: Text('등록',
                  style: TextStyle(color: Colors.white)), // 버튼 텍스트 색상 변경
            ),
          ),
        ],
      ),
    );
  }
}
