import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/book_reply_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomReviewInsert extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(gapMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    controller: _content,
                    style: body1(mFontWeight: FontWeight.w500),
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
            SizedBox(width: gapMedium),
            Container(
              height: 58,
              child: TextButton(
                onPressed: () {
                  SessionUser session = ref.read(sessionStore);
                  BookReplyWriteReqDTO dto = BookReplyWriteReqDTO(
                      userId: session.user!.id,
                      bookId: 1,
                      content: _content.text);
                  //TODO: 여기 이전 페이지부터 bookId 넘겨줘야함
                  // ref.read(bookReplyListProvider.notifier).notifyAdd(dto, );
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
      ),
    );
  }
}
