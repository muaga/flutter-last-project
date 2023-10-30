import 'package:flutter/material.dart';
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
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(userUrlPic),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  username,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
