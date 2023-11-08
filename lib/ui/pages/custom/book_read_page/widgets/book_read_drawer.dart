import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class BookReadDrawer extends StatefulWidget {
  const BookReadDrawer({super.key, required this.bookModel});

  final BookDetailModel bookModel;

  @override
  State<BookReadDrawer> createState() => _BookReadDrawerState();
}

class _BookReadDrawerState extends State<BookReadDrawer> {
  bool isExpanded = false;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ExpansionTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.min, // 크기 제약을 줍니다.
                      children: [
                        iconBookMark(mColor: kPrimaryColor),
                        SizedBox(width: gapXlarge),
                        Text(
                          "북마크",
                          style: subTitle3(mFontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      isExpanded
                          ? Icons.expand_less
                          : Icons.expand_more, // 확장 및 축소 아이콘 변경
                      color: Colors.black, // 아이콘 색상
                    ),
                    onExpansionChanged: (bool expanding) {
                      setState(() {
                        isExpanded = expanding;
                      });
                    },
                    children: [Text("여기 북마크 들어갈 자리")],
                    // initiallyExpanded: isExpanded,
                  ),
                ),
              ],
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
