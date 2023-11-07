import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomLikeCount extends StatelessWidget {
  const CustomLikeCount({
    super.key,
  });

  // TODO : postLike 데이터 받아오기

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 30,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            side: BorderSide(style: BorderStyle.solid, width: 0.3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Row(
            children: [
              iconEmptyHeart(mSize: 17),
              SizedBox(width: gapSmall),
              Text("76", style: body2()),
            ],
          )),
    );
  }
}
