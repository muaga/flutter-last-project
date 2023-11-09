import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/data/model/user.dart';

class PostDetailWriter extends StatelessWidget {
  // TODO : userId로 user정보 찾기
  final int userId;
  final Board board;

  const PostDetailWriter({required this.userId, required this.board});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        dio.options.baseUrl + "/images/user1.png"),
                  ),
                ),
                SizedBox(width: gapMain),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: subTitle3(),
                    ),
                    Text(
                      board.createdAt,
                      style: body2(mFontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
