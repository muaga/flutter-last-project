import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MyLibraryMainReadingNotePostBook extends StatelessWidget {
  final String picUrl;
  final String title;
  final String writer;
  const MyLibraryMainReadingNotePostBook(
      {required this.picUrl, required this.writer, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 화면 너비의 80%
      height: MediaQuery.of(context).size.height / 7,
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
              imageUrl: dio.options.baseUrl + "/images/${picUrl}",
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
                  Text(title, style: subTitle2()),
                  SizedBox(height: gapSmall),
                  Text(writer,
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
