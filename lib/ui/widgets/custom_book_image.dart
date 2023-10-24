import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomBookImage extends StatelessWidget {
  final String picUrl;
  const CustomBookImage({required this.picUrl});

  @override
  Widget build(BuildContext context) {
    double imageHeight = getScreenHeight(context) / 2.5; // 책 이미지의 높이
    double imageWidth = imageHeight * 1 / 1.4;

    return Center(
      child: Container(
        height: imageHeight,
        width: imageWidth,
        child: CachedNetworkImage(
          imageUrl: "http://192.168.0.40:8080/images/${picUrl}",
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(
            strokeWidth: 5,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // 그림자 색상
              offset: Offset(4, 4), // 그림자 위치
              blurRadius: 20, // 그림자 흐림 정도
            ),
          ],
        ),
      ),
    );
  }
}
