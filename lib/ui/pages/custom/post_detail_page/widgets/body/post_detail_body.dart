import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_like_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_title.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_writer.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/view_model/post_detail_page_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_recommend-book-card.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailBody extends ConsumerWidget {
  final int boardId;
  const PostDetailBody({required this.boardId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 로그인 유무
    final SessionUser sessionUser = ref.read(sessionStore);

    PostDetailModel? model = ref.watch(postDetailProvider(boardId));
    if (model == null) {
      return CircularProgressIndicator();
    }

    Logger().d(model.bookPicUrl);

    if (model.bookPicUrl != null && model.bookPicUrl!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(gapMain),
        child: ListView(
          children: [
            PostDetailTitle(model!.boardTitle),
            SizedBox(height: gapXlarge),
            PostDetailWriter(
                boardUserNickname: model.boardUserNickname,
                createdAt: model.boardCreatedAt),
            SizedBox(height: gapLarge),
            CustomThinLine(),
            SizedBox(height: gapLarge),
            PostDetailContent(model.boardContent),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: gapLarge),
                CustomThinLine(),
                SizedBox(height: gapLarge),
                Text("추천도서", style: subTitle2()),
                SizedBox(height: gapLarge),
                Container(
                  width: getScreenWidth(context) / 3,
                  height: getScreenWidth(context) * 0.7,
                  child: PostWriteRecommendBookCard(
                    bookId: model.bookId!,
                    bookPicUrl: model.bookPicUrl!,
                    bookTitle: model.bookTitle!,
                    bookWriter: model.bookWriter!,
                  ),
                ),
              ],
            ),
            SizedBox(height: gapMain),
            PostDetailLikeForm(),
            PostDetailOneReviewForm(),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(gapMain),
        child: ListView(
          children: [
            PostDetailTitle(model!.boardTitle),
            SizedBox(height: gapXlarge),
            PostDetailWriter(
                boardUserNickname: model.boardUserNickname,
                createdAt: model.boardCreatedAt),
            SizedBox(height: gapLarge),
            CustomThinLine(),
            SizedBox(height: gapLarge),
            PostDetailContent(model.boardContent),
            SizedBox(height: gapXlarge),
            PostDetailLikeForm(),
            PostDetailOneReviewForm(),
          ],
        ),
      );
    }
  }
}
