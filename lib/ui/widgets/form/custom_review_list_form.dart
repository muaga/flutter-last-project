import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/custom_review_insert.dart';

class CustomReviewListForm extends StatelessWidget {
  const CustomReviewListForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomReviewCard(
          username: "ssar",
          writeAt: "2023.10.19",
          review: "향수에 관심이 생겼어요",
        ),
        CustomReviewCard(
          username: "cos",
          writeAt: "2023.10.18",
          review: "책을 읽으며 힐링되는 시간",
        ),
        CustomReviewCard(
          username: "love",
          writeAt: "2023.10.07",
          review: "다양한 식물에서 이런 향을 낼 수 있다는게 신기해요",
        ),
        CustomReviewInsert(),
      ],
    );
  }
}
