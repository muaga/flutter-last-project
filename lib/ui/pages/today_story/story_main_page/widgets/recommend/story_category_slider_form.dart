import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';

class StoryCategorySliderForm extends StatelessWidget {
  const StoryCategorySliderForm({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookId: book.id)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image(
                image: CachedNetworkImageProvider(
                  dio.options.baseUrl + "/images/${book.picUrl}",
                ),
                height: getScreenWidth(context) * 0.5,
              ),
            ),
            SizedBox(height: gapMedium),
            Text("${book.title}", style: subTitle3()),
            Text(
              "${book.writer}",
              style: body2(mColor: kFontGray, mFontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
