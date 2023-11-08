import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/custom_review_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class PostDetailOneReviewForm extends StatelessWidget {
  const PostDetailOneReviewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomReviewInsert(),
        CustomThinLine(),
        CustomReviewCard(
          userPicUrl: "user1.png",
          nickName: "배트맨",
          writeAt: "2023.10.22",
          review: "asd",
        ),
        CustomReviewCard(
            userPicUrl: "user1.png",
            nickName: "아연맨",
            writeAt: "2023.10.21",
            review: "오늘 하루 되는게 하나도 없어 힘들었는데 많은 위로 받고 갑니다."),
        CustomReviewCard(
          userPicUrl: "user1.png",
          nickName: "북방조개",
          writeAt: "2023.10.21",
          review: "나도 커피 한 잔 하고 싶네요",
        ),
      ],
    );
  }
}
