import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/view_model/book_read_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookReadDrawer extends ConsumerStatefulWidget {
  BookReadDrawer(
      {super.key,
      required this.bookModel,
      required this.bookData,
      required this.pageController,
      this.bookMarkList});

  final BookDetailModel bookModel;
  final List<String> bookData;
  final PageController pageController;
  late List<BookMarkDTO>? bookMarkList;

  @override
  _BookReadDrawerState createState() => _BookReadDrawerState();
}

class _BookReadDrawerState extends ConsumerState<BookReadDrawer> {
  bool isExpanded = false;
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  void toggleDescription() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Drawer contents
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  dio.options.baseUrl +
                      "/images/${widget.bookModel.bookPicUrl}",
                ),
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9),
                  BlendMode.srcATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(gapMain),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 90,
                    height: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                dio.options.baseUrl +
                                    "/images/${widget.bookModel.bookPicUrl}"))),
                  ),
                  SizedBox(width: gapMedium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.bookModel.bookTitle}", style: subTitle2()),
                      Text("${widget.bookModel.bookWriter}",
                          style: body2(
                              mColor: kFontGray,
                              mFontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // CustomThinLine(),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(gapMain),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      iconBookMark(mColor: kPrimaryColor),
                      const SizedBox(width: gapXlarge),
                      Text("북마크")
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              if (widget.bookMarkList != null &&
                                  widget.bookMarkList!.isNotEmpty) {
                                return AlertDialog(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: gapSmall),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "북마크",
                                          style: subTitle1(
                                              mFontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                            "${widget.bookMarkList?.length ?? ""}개",
                                            style: body2(
                                                mFontWeight:
                                                    FontWeight.normal)),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: iconClose(),
                                    ),
                                  ],
                                  content: Container(
                                    height: getScreenWidth(context),
                                    width: getScreenWidth(context) * 1.2,
                                    child: RefreshIndicator(
                                      key: refreshKey,
                                      onRefresh: () async {
                                        await ref
                                            .read(bookReadProvider(
                                                    widget.bookModel.bookId)
                                                .notifier)
                                            .notifyInit2(
                                                widget.bookModel.bookId);
                                      },
                                      child: CustomScrollView(
                                        slivers: [
                                          SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    // int clickedIndex = index;
                                                    setState(() {
                                                      widget.pageController
                                                          .animateToPage(
                                                              widget
                                                                  .bookMarkList![
                                                                      index]
                                                                  .scroll!,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease);
                                                      Logger().d(
                                                          "인덱스 : ${widget.bookMarkList![index].scroll!}");
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        gapSmall),
                                                    child: Container(
                                                      width: getScreenWidth(
                                                              context) *
                                                          0.6,
                                                      height: getScreenWidth(
                                                              context) *
                                                          0.25,
                                                      decoration: BoxDecoration(
                                                        color: kBackWhite,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                kFontLightGray,
                                                            // 그림자의 색상
                                                            offset:
                                                                Offset(0, 1),
                                                            // 그림자의 위치 (x, y)
                                                            blurRadius: 5.0,
                                                            // 그림자의 흐림 정도
                                                            spreadRadius:
                                                                1.0, // 그림자의 확산 정도
                                                          )
                                                        ],
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              // TODO 은혜 : 북마크 삭제 기능 넣기
                                                            },
                                                            icon: iconBookMark(
                                                                mSize: 15,
                                                                mColor:
                                                                    kPrimaryColor),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 14),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "${widget.bookData[widget.bookMarkList![index].scroll!]}",
                                                                    style: body2(
                                                                        mFontWeight:
                                                                            FontWeight
                                                                                .normal),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines:
                                                                        3),
                                                                const SizedBox(
                                                                    height:
                                                                        gapSmall),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text:
                                                                              "${widget.bookMarkList![index].scroll! + 1}p",
                                                                          style:
                                                                              body2(mFontWeight: FontWeight.w500)),
                                                                      TextSpan(
                                                                          text:
                                                                              "   |   ",
                                                                          style:
                                                                              body2(mFontWeight: FontWeight.normal)),
                                                                      TextSpan(
                                                                          text:
                                                                              "${widget.bookMarkList![index].bookMarkCreatedAt}",
                                                                          style:
                                                                              body2(mFontWeight: FontWeight.normal))
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              childCount: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(gapXlarge),
                                );
                              } else {
                                return AlertDialog(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: gapSmall),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "북마크",
                                          style: subTitle1(
                                              mFontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                            "${widget.bookMarkList?.length ?? ""}개",
                                            style: body2(
                                                mFontWeight:
                                                    FontWeight.normal)),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: iconClose(),
                                    ),
                                  ],
                                  content: Container(
                                      height: getScreenWidth(context),
                                      width: getScreenWidth(context) * 1.2),
                                );
                              }
                            });
                      },
                      icon: iconArrowForward(mSize: 16))
                ],
              ),
            ),
          ),
          CustomThickLine(),
          ListTile(
            leading: iconBottomToday(),
            title: Text("투데이"),
            onTap: () {},
          ),
          ListTile(
            leading: iconBottomFeed(),
            title: Text("피드"),
            onTap: () {
              // 내 서재 화면으로 이동하거나 다른 작업 수행
            },
          ),
          ListTile(
            leading: iconBottomSearch(),
            title: Text("검색"),
            onTap: () {
              // 설정 화면으로 이동하거나 다른 작업 수행
            },
          ),
          ListTile(
            leading: iconBottomlibrary(),
            title: Text("내서재"),
            onTap: () {
              // 설정 화면으로 이동하거나 다른 작업 수행
            },
          ),
        ],
      ),
    );
  }
}
