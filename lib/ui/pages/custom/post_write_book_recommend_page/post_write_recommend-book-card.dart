import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';

class PostWriteRecommendBookCard extends StatelessWidget {
  Book? book;

  PostWriteRecommendBookCard(this.book); // 'book' 매개변수를 생성자에 추가

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: dio.options.baseUrl + "/images/${book?.picUrl}",
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(
            strokeWidth: 5,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: gapSmall),
        Container(
          height: 60,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book?.title ?? "제목 없음",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: gapSmall),
              Text(
                book?.writer ?? "",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
