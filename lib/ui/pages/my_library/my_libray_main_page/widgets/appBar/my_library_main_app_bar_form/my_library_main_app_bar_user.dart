import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_main_app_bar_bottom_sheet.dart';

class MyLibraryMainAppBarUser extends StatelessWidget {
  final String username;
  final String userUrlPic;
  const MyLibraryMainAppBarUser(
      {required this.username, required this.userUrlPic});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      "http://192.168.0.40:8080/images/${userUrlPic}",
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  username,
                  style: title1(),
                ),
              ],
            ),
          ),
          MtLibraryMainAppbarBottomSheet()
        ],
      ),
    );
  }
}
