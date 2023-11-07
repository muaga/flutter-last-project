import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';

class CustomGridBookCard extends StatelessWidget {
  final Book? book;
  const CustomGridBookCard({this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: dio.options.baseUrl + "/images/${book?.picUrl ?? ""}",
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(
              strokeWidth: 5,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: gapSmall),
        Container(
          height: 65,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book?.title ?? "",
                style: subTitle3(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // text ...
              ),
              SizedBox(height: gapSmall),
              Text(
                book?.writer ?? "",
                style: body4(mColor: kFontGray),
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
