import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_app_bar_tabs.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_main_app_bar_user.dart';

class MyLibraryMainAppBar extends StatelessWidget {
  const MyLibraryMainAppBar({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      snap: false,
      floating: false,
      pinned: true,
      toolbarHeight: 120,
      backgroundColor: kPrimaryColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40), // 탭바의 높이 설정
        child: Container(
          color: Colors.white, // 탭바 배경색
          child: MyLibraryMainAppBarTabs(),
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 55),
        child: MyLibraryMainAppBarUser(
            username: "${user.username}의 서재", userUrlPic: "${user.picUrl}"),
      ),
    );
  }
}
