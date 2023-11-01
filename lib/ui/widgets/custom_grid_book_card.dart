import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:logger/logger.dart';

class CustomGridBookCard extends StatelessWidget {
  final Book book;
  const CustomGridBookCard(this.book);

  @override
  Widget build(BuildContext context) {
    Logger().d("book 이미지 : ${book.id} - ${book.picUrl}");
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: "http://192.168.0.37:8080/images/${book.picUrl}",
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(
              strokeWidth: 5,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: gapSmall),
        Container(
          height: 60,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title ?? "",
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
                book.writer ?? "",
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
    );
  }
}
