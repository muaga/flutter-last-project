import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_like_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_title.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_writer.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  const PostDetailBody({required this.board, Key? key}) : super(key: key);
  final Board board;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PostDetailModel? model = ref.watch(postDetailProvider);
    // Post post = model!.post;

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
          SizedBox(height: gapXxlarge),
          PostDetailLikeForm(),
          PostDetailOneReviewForm(),
        ],
      ),
    );
  }
}
