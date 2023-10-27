import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';

class BookReplyListPage extends StatefulWidget {
  final int bookId;
  final List<BookDetailReplyList>? bookDetailReplyList;

  const BookReplyListPage(
      {required this.bookId, required this.bookDetailReplyList});

  @override
  State<BookReplyListPage> createState() => _BookReplyListPageState();
}

class _BookReplyListPageState extends State<BookReplyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("리뷰 모음"),
      ),
      bottomNavigationBar: MillieBottomNavigationBar(),
      body: CustomReviewCard(
        userPicUrl: "${widget.bookDetailReplyList![0].userPicUrl}",
        username: "${widget.bookDetailReplyList![0].nickname}",
        writeAt: "${widget.bookDetailReplyList![0].replyCreatedAt}",
        review: "${widget.bookDetailReplyList![0].replyContent}",
      ),
    );
  }
}
