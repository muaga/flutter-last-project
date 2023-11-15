import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/body/post_detail_body.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/view_model/post_detail_page_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_update_page/post_update_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailPage extends ConsumerWidget {
  final int boardId;
  PostDetailPage({required this.boardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("보드 아이디 : ${boardId}");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(""),
        actions: [
          IconButton(
            onPressed: () {},
            icon: iconEmptyHeart(),
          ),
          IconButton(
            onPressed: () async {
              PostDetailModel? model =
                  await ref.read(postDetailProvider(boardId));
              Logger().d("기존내용 : ${model}");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostUpdatePage(board: model)));
            },
            icon: iconReply(),
          ),
        ],
      ),
      body: PostDetailBody(boardId: boardId),
    );
  }
}
