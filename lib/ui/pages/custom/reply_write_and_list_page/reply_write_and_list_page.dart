import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';

class ReplyWriteAndListPage extends StatelessWidget {
  final int bookId;
  final _content = TextEditingController();

  ReplyWriteAndListPage({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("한 줄리뷰"),
      ),
      body: Padding(
        padding: EdgeInsets.all(gapMain),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "호기심 많은 룰룰루님\n"
                      "한 줄 리뷰를 작성해보세요",
                      style: subTitle1(),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          dio.options.baseUrl + "/images/user1.png"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gapMain),
            Expanded(
              child: Stack(
                children: [
                  TextFormField(
                    controller: _content,
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
            SizedBox(height: gapMain),
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
            CustomThickLine(),
            Padding(
              padding: const EdgeInsets.all(gapMain),
              child: Container(
                child: Text("총 21개", style: subTitle2()),
              ),
            ),
            CustomReviewCard(
                userPicUrl: "user1.png",
                nickName: "삽살개",
                writeAt: "2023.10.31",
                review: "꺄르륵"),
            CustomReviewCard(
                userPicUrl: "user1.png",
                nickName: "풍산개",
                writeAt: "2023.10.20",
                review: "꺄르륵"),
            CustomReviewCard(
                userPicUrl: "user1.png",
                nickName: "진돗개",
                writeAt: "2023.10.11",
                review: "꺄르륵"),
          ],
        ),
      ),
    );
  }
}
