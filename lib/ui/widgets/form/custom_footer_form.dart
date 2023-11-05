import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

/// footer => 이대로 사용하면 됨

class CustomFooterForm extends StatelessWidget {
  const CustomFooterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: kBackIbory,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("(주) 밀리의 서재", style: subTitle2()),
            SizedBox(height: gapLarge),
            Text(
              "이용약관 >    개인정보처리방침 >    청소년보호청책 >    고객센터 > ",
              style: body4(mFontWeight: FontWeight.normal, mColor: kFontGray),
            ),
            SizedBox(height: gapMedium),
            Text(
              "환불신청 >    B2B문의 >    콘텐츠제휴문의 >    저작권/도서오류 신고 >",
              style: body4(mFontWeight: FontWeight.normal, mColor: kFontGray),
            ),
            SizedBox(height: gapMedium),
            Text(
              "뷰어 다운로드 >    종료 예정 도서 >    회사 소개 >",
              style: body4(mFontWeight: FontWeight.normal, mColor: kFontGray),
            ),
            SizedBox(height: gapLarge),
            Text("Copyright ⓒ 2022 밀리의 서재 All Rights Reserved.",
                style: body3(mColor: kFontGray)),
          ],
        ),
      ),
    );
  }
}
