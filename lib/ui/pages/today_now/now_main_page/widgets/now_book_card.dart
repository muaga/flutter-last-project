import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';

class NowBookCard extends StatelessWidget {
  final BookListDTO? book;
  const NowBookCard({this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(bookId: book!.bookId)));
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: dio.options.baseUrl + "/images/${book?.bookPicUrl ?? ""}",
            height: getScreenWidth(context) * 0.45,
            width: getScreenWidth(context) * 0.3,
            fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(
              strokeWidth: 5,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: gapSmall),
          Container(
            height: 60,
            width: getScreenWidth(context) * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book?.bookTitle ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // text ...
                ),
                SizedBox(height: gapSmall),
                Text(
                  book?.bookWriter ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // text ...
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
