import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/ui/widgets/bottom_sheet/custom_write_bottom_sheet.dart';

class MyLibraryMainAppBarUser extends StatelessWidget {
  final String username;
  final String userUrlPic;
  final String email;
  const MyLibraryMainAppBarUser(
      {required this.username, required this.userUrlPic, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      dio.options.baseUrl + "/images/${userUrlPic}",
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: subTitle1()),
                    Text(email, style: subTitle3(mFontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
          CustomWriteBottomSheet()
        ],
      ),
    );
  }
}
