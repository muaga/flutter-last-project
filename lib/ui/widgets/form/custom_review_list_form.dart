import 'package:flutter/material.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/custom_review_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/validation_guide/login_validation_guide.dart';
import 'package:logger/logger.dart';

class CustomReviewListForm extends StatefulWidget {
  final List<BookDetailReplyList>? replyList;
  final SessionUser sessionUser;

  const CustomReviewListForm({this.replyList, required this.sessionUser});

  @override
  State<CustomReviewListForm> createState() => _CustomReviewListFormState();
}

class _CustomReviewListFormState extends State<CustomReviewListForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.replyList != null
                ? (widget.replyList!.length > 3 ? 3 : widget.replyList!.length)
                : 0,
            // replyList가 존재할 때 갯수가 3이 넘으면 3개, 3이 넘지 않으면 replyList의 갯수
            // replyList가 존재하지 않으면, 0
            itemBuilder: (context, index) {
              return CustomReviewCard(
                nickName: widget.replyList?[index].nickname,
                userPicUrl: widget.replyList?[index].userPicUrl,
                review: widget.replyList?[index].replyContent,
                writeAt: widget.replyList?[index].replyCreatedAt,
              );
            }),
        CustomReviewInsert(),
      ],
    );
  }
}
