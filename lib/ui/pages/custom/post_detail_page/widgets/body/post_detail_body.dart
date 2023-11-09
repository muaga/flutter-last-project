import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_like_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_title.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_writer.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_recommend-book-card.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  const PostDetailBody({required this.board, Key? key}) : super(key: key);
  final Board board;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PostDetailModel? model = ref.watch(postDetailProvider);
    // Post post = model!.post;
    final int? bookId = board.bookId;
    BookDetailModel? detailBook;
    if (bookId != null) {
      BookDetailModel? model = ref.read(bookDetailProvider(bookId));
      detailBook = model!;
    }

    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          PostDetailTitle(board.title),
          SizedBox(height: gapXlarge),
          PostDetailWriter(userId: board.userId, board: board),
          SizedBox(height: gapLarge),
          CustomThinLine(),
          SizedBox(height: gapLarge),
          PostDetailContent(board.content),
          if (board.picUrl != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: gapLarge),
                CustomThinLine(),
                const SizedBox(height: gapLarge),
                Text("추천도서", style: subTitle2()),
                SizedBox(height: gapLargegt),
                Container(
                  width: getScreenWidth(context) / 3,
                  height: getScreenWidth(context) * 0.5,
                  child: PostWriteRecommendBookCard(
                    bookPicUrl: detailBook!.bookPicUrl,
                    bookTitle: detailBook!.bookTitle,
                    bookWriter: detailBook!.bookWriter,
                  ),
                )
              ],
            ),
          SizedBox(height: gapMain),
          PostDetailLikeForm(),
          PostDetailOneReviewForm(),
        ],
      ),
    );
  }
}
