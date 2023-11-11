import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/widgets/feed_main_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CustomPostListForm extends ConsumerWidget {
  const CustomPostListForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FeedMainModel? model = ref.watch(feedMainProvider);

    if (model != null) {
      List<BoardDTO> boardList = [];
      boardList = model.boardList;
      Logger().d(boardList.length);

      return ListView.builder(
        shrinkWrap: true,
        itemCount: boardList.length,
        itemBuilder: (context, index) {
          /// bookId의 유무
          final hasPicUrl = boardList[index].bookId != null; // true(존재)

          /// 만약 존재한다면,
          if (hasPicUrl) {
            BookDetailModel? book =
                ref.read(bookDetailProvider(boardList[index].bookId!));
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostDetailPage(boardId: boardList[index].id)));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: gapXlarge, vertical: gapMain),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              dio.options.baseUrl +
                                  "/images/${book?.bookPicUrl}",
                            ),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.8),
                              BlendMode.srcATop,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kFontLightGray, // 그림자의 색상
                              offset: Offset(0, 1), // 그림자의 위치 (x, y)
                              blurRadius: 5.0, // 그림자의 흐림 정도
                              spreadRadius: 1.0, // 그림자의 확산 정도
                            )
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: gapMain, horizontal: gapLarge),
                          child: CachedNetworkImage(
                            imageUrl: dio.options.baseUrl +
                                "/images/${book?.bookPicUrl}",
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kBackWhite,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kBackGray, // 그림자의 색상
                              offset: Offset(0, 1), // 그림자의 위치 (x, y)
                              blurRadius: 5.0, // 그림자의 흐림 정도
                              spreadRadius: 1.0, // 그림자의 확산 정도
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(gapMain),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: gapMain),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(boardList[index].boardTitle,
                                        style: subTitle3(),
                                        overflow: TextOverflow.ellipsis),
                                    SizedBox(height: gapSmall),
                                    Text(boardList[index].content,
                                        style: body1(
                                            mFontWeight: FontWeight.normal),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              CustomThinLine(),
                              ListTile(
                                contentPadding: EdgeInsets.only(left: 0),
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    dio.options.baseUrl +
                                        "/images/${boardList[index].userPicUrl}",
                                  ),
                                ),
                                title: Text(
                                    "${boardList[index].userNickname}의 서재"),
                                titleTextStyle:
                                    subTitle3(mFontWeight: FontWeight.w500),
                                subtitle:
                                    Text("${boardList[index].boardCreatedAt}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            /// bookId가 없을 때
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostDetailPage(boardId: boardList[index].id)));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: gapXlarge, vertical: gapMain),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // 그림자의 색상
                                offset: Offset(0, 1), // 그림자의 위치 (x, y)
                                blurRadius: 5.0, // 그림자의 흐림 정도
                                spreadRadius: 1.0, // 그림자의 확산 정도
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(gapMain),
                            child: Text(
                              boardList[index].boardTitle,
                              style: subTitle2(),
                            ),
                          )),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kBackWhite,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kBackGray, // 그림자의 색상
                              offset: Offset(0, 1), // 그림자의 위치 (x, y)
                              blurRadius: 5.0, // 그림자의 흐림 정도
                              spreadRadius: 1.0, // 그림자의 확산 정도
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(gapMain),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: gapMain),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(boardList[index].content,
                                        style: body1(
                                            mFontWeight: FontWeight.normal),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              CustomThinLine(),
                              ListTile(
                                contentPadding: EdgeInsets.only(left: 0),
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    // TODO 은혜 : 게시글 유저 이미지 넣기
                                    dio.options.baseUrl +
                                        "/images/${boardList[index].userPicUrl}",
                                  ),
                                ),
                                title: Text(
                                    "${boardList[index].userNickname}의 서재"),
                                titleTextStyle:
                                    subTitle3(mFontWeight: FontWeight.w500),
                                subtitle:
                                    Text("${boardList[index].boardCreatedAt}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }
}
