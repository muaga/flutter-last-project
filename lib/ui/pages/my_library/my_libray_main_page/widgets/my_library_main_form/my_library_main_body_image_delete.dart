import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/custom_delete_alert_dialog.dart';

class MyLibraryMainBodyImageDelete extends StatelessWidget {
  final Book book;

  const MyLibraryMainBodyImageDelete({required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 이미지를 선택했을 때 바텀 시트를 올릴 코드를 추가
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDeleteAlertDialog(
                title: "안녕", buttonText: "안녕", content: "안녕");
          },
        );
      },
      child: CachedNetworkImage(
        imageUrl: dio.options.baseUrl + "/images/${book.picUrl}",
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(
          strokeWidth: 5,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
