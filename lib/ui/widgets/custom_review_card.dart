import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
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
      trailing: PopupMenuButton<String>(
        onSelected: (String choice) {
          if (choice == "delete") {
            // 삭제 작업을 수행하거나 삭제 다이얼로그를 표시할 수 있습니다.
            // 예를 들어 showDialog()를 사용하여 삭제 확인 대화상자를 표시할 수 있습니다.
          }
        },
        itemBuilder: (BuildContext context) {
          return ["삭제하기"].map((String choice) {
            return PopupMenuItem<String>(
              padding: EdgeInsets.only(left: 25),
              height: 20,
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }
}
