import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomNoticeForm extends StatelessWidget {
  const CustomNoticeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "· 탈퇴를 하실 경우, 어떤 경우에도 기존 서재의 대한 복구는 불가능하며, 로그인이 필요한 모든 서비스를 이용하실 수 없습니다.",
              style: body4()),
          SizedBox(height: gapSmall),
          Text(
              "· 탈퇴를 하실 경우 기 결제하신 서비스 이용 권한과 구매 내역을 포기하는 것으로 간주됩니다. 원치 않으실 경우, 탈퇴를 보류해주세요.",
              style: body4()),
          SizedBox(height: gapSmall),
          Text("· 정기결제 상품을 이용 중인 경우 결제수단을 등록 해지해야 회원 탈퇴가 가능합니다.",
              style: body4()),
          SizedBox(height: gapSmall),
          Text(
              "· 탈퇴 시에도 회원님이 작성하신 포스트, 댓글, 작품을 포함한 모든 게시물은 자동 삭제되지 않습니다. 노출을 원치 않으시면 반드시 미리 삭제하신 후 탈퇴해주세요.",
              style: body4()),
        ],
      ),
    );
  }
}
