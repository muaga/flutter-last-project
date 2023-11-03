import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/custom/post_list_page/post_list_page_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_list_page/widgets/post_list_body/post_list_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostListPage extends ConsumerWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "나의 포스트 목록",
          style: title1(),
        ),
        actions: [],
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          Logger().d("리플래시됨");
          ref.read(postListProvider.notifier).notifyInit();
        },
        child: PostListBody(),
      ),
    );
  }
}
