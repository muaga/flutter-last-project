import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';

class CustomLikeCount extends StatelessWidget {
  const CustomLikeCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // 테두리 색상
          width: 1.0, // 테두리 두께
        ),
        borderRadius: BorderRadius.circular(30), // 테두리 모서리를 둥글게 만듭니다.
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: iconEmptyHeart(),
          ),
          Text("76"),
        ],
      ),
    );
  }
}
