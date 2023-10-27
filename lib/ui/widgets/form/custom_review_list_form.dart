import 'package:flutter/material.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/custom_review_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/validation_guide/login_validation_guide.dart';

class CustomReviewListForm extends StatefulWidget {
  final List<BookDetailReplyList>? bookDetailReplyList;
  final SessionUser sessionUser;

  const CustomReviewListForm(
      {this.bookDetailReplyList, required this.sessionUser});

  @override
  State<CustomReviewListForm> createState() => _CustomReviewListFormState();
}

class _CustomReviewListFormState extends State<CustomReviewListForm> {
  @override
  Widget build(BuildContext context) {
    if (widget.sessionUser.isLogin == true) {
      return Column(
        children: [
          if (widget.bookDetailReplyList != null &&
              widget.bookDetailReplyList!.isNotEmpty)
            CustomReviewCard(
              userPicUrl: "${widget.bookDetailReplyList![0].userPicUrl}",
              username: "${widget.bookDetailReplyList![0].nickname}",
              writeAt: "${widget.bookDetailReplyList![0].replyCreatedAt}",
              review: "${widget.bookDetailReplyList![0].replyContent}",
            ),
          CustomReviewCard(
            userPicUrl: "${widget.bookDetailReplyList![1].userPicUrl}",
            username: "${widget.bookDetailReplyList![1].nickname}",
            writeAt: "${widget.bookDetailReplyList![1].replyCreatedAt}",
            review: "${widget.bookDetailReplyList![1].replyContent}",
          ),
          CustomReviewCard(
            userPicUrl: "${widget.bookDetailReplyList![2].userPicUrl}",
            username: "${widget.bookDetailReplyList![2].nickname}",
            writeAt: "${widget.bookDetailReplyList![2].replyCreatedAt}",
            review: "${widget.bookDetailReplyList![2].replyContent}",
          ),
          CustomReviewInsert(),
        ],
      );
    } else {
      return Column(children: [
        if (widget.bookDetailReplyList != null &&
            widget.bookDetailReplyList!.isNotEmpty)
          CustomReviewCard(
            userPicUrl: "${widget.bookDetailReplyList![0].userPicUrl}",
            username: "${widget.bookDetailReplyList![0].nickname}",
            writeAt: "${widget.bookDetailReplyList![0].replyCreatedAt}",
            review: "${widget.bookDetailReplyList![0].replyContent}",
          ),
        CustomReviewCard(
          userPicUrl: "${widget.bookDetailReplyList![1].userPicUrl}",
          username: "${widget.bookDetailReplyList![1].nickname}",
          writeAt: "${widget.bookDetailReplyList![1].replyCreatedAt}",
          review: "${widget.bookDetailReplyList![1].replyContent}",
        ),
        CustomReviewCard(
          userPicUrl: "${widget.bookDetailReplyList![2].userPicUrl}",
          username: "${widget.bookDetailReplyList![2].nickname}",
          writeAt: "${widget.bookDetailReplyList![2].replyCreatedAt}",
          review: "${widget.bookDetailReplyList![2].replyContent}",
        ),
        CustomThinLine(),
        LoginValidationImage(),
      ]);
    }
  }
}
