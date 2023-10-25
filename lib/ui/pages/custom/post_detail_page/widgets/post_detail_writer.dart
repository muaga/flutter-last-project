import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class PostDetailWriter extends StatelessWidget {
  const PostDetailWriter({
    super.key,
  });

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
                  height: gapXlarge,
                  width: gapXlarge,
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/user_images/avatar.png"),
                  ),
                ),
                SizedBox(width: gapSmall),
                Text(
                  "말 많은 소녀",
                  style: body1(),
                ),
                SizedBox(width: gapSmall),
                Text(
                  "2023.03.07",
                  style: body1(),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "팔로우",
              style: TextStyle(
                color: Colors.white, // 글자색
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black, // 버튼의 배경색
            ),
          ),
        ],
      ),
    );
  }
}
