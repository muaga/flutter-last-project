import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';

class MyLibraryMainReadingNoteBook extends StatelessWidget {
  final Book book;
  const MyLibraryMainReadingNoteBook({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 화면 너비의 80%
      height: MediaQuery.of(context).size.height / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBackLight2Gray,
      ),
      child: Row(
        children: [
          SizedBox(width: gapLarge),
          Container(
            height: MediaQuery.of(context).size.height / 7 * 0.8,
            width: MediaQuery.of(context).size.width / 6 * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: "http://192.168.0.40:8080/images/${book.picUrl}",
              fit: BoxFit.fill,
              placeholder: (context, url) => CircularProgressIndicator(
                strokeWidth: 5,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(width: gapMedium),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: subTitle2()),
                  SizedBox(height: gapSmall),
                  Text(book.writer,
                      style: subTitle3(mFontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
