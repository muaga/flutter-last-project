import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/book_reply_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/reply_write_and_list_page/reply_write_and_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyWriteAndListPage extends ConsumerWidget {
  final int bookId;
  final _content = TextEditingController();

  ReplyWriteAndListPage({required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(bookReplyListProvider(bookId).notifier).notifyInit(bookId);
    BookReplyListModel? model = ref.watch(bookReplyListProvider(bookId));

    if (model == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("한 줄리뷰"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            BookReplyListModel? model =
                ref.watch(bookReplyListProvider(bookId));
            return [
              SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "호기심 많은 룰룰루님\n"
                          "한 줄 리뷰를 작성해보세요",
                          style: subTitle1(),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              dio.options.baseUrl + "/images/user1.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: gapMain),
              ),
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    TextFormField(
                      controller: _content,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: "다양한 생각을 남겨주세요",
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      maxLength: 50,
                    ),
                    Positioned(
                      top: 5,
                      left: 12,
                      child: Text(
                        "한 줄 리뷰",
                        style: body2(mColor: kFontGray),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: gapMain),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 58,
                  child: TextButton(
                    onPressed: () {
                      SessionUser session = ref.read(sessionStore);
                      BookReplyWriteReqDTO dto = BookReplyWriteReqDTO(
                          userId: session.user!.id,
                          bookId: bookId,
                          content: _content.text);
                      ref
                          .read(bookReplyListProvider(bookId).notifier)
                          .notifyAdd(dto);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('등록', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CustomThickLine(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(gapMain),
                  child:
                      Text("총 ${model!.replyDTOs.length}개", style: subTitle2()),
                ),
              ),
            ];
          },
          body: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model!.replyDTOs.length,
            itemBuilder: (context, index) {
              BookReplyListModel? model =
                  ref.watch(bookReplyListProvider(bookId));
              return CustomReviewCard(
                userPicUrl: model!.replyDTOs[index].userPicUrl,
                nickName: model!.replyDTOs[index].nickname,
                review: model!.replyDTOs[index].replyContent,
                writeAt: model!.replyDTOs[index].replyCreatedAt,
              );
            },
          ),
        ),
      ),
    );
  }
}
