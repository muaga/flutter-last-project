import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomReviewCard extends StatelessWidget {
  final String username;
  final String writeAt;
  final String review;
  const CustomReviewCard(
      {required this.username, required this.writeAt, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(gapMain),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage("assets/user_images/avatar.png"),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: subTitle2()),
          Text(writeAt, style: body3()),
        ],
      ),
      subtitle: Text(
        review,
        style: body1(),
      ),
      trailing: InkWell(
        onTap: () {},
        child: iconDotMenu(),
      ),
    );
  }
}
