import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';

class StoryCategorySliderForm extends StatelessWidget {
  const StoryCategorySliderForm({super.key, required this.book});

  final StoryBookDTO book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookId: book.bookId)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image(
                image: CachedNetworkImageProvider(
                  dio.options.baseUrl + "/images/${book.bookPicUrl}",
                ),
                height: getScreenWidth(context) * 0.5,
              ),
            ),
            SizedBox(height: gapMedium),
            Text("${book.bookTitle}", style: subTitle3()),
            Text(
              "${book.bookWriter}",
              style: body2(mColor: kFontGray, mFontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
