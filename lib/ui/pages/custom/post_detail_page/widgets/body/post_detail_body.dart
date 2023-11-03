import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_like_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_title.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_writer.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  const PostDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailModel? model = ref.watch(postDetailProvider);
    Post post = model!.post;

    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          PostDetailTitle(post.title),
          SizedBox(height: gapXxlarge),
          PostDetailWriter(),
          SizedBox(height: gapXlarge),
          CustomThinLine(),
          SizedBox(height: gapXlarge),
          PostDetailContent(post.content),
          SizedBox(height: gapXxlarge),
          PostDetailLikeForm(),
          PostDetailOneReviewForm(),
        ],
      ),
    );
  }
}
