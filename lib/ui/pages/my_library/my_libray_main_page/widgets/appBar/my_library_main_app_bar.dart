import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_app_bar_tabs.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar_form/my_library_main_app_bar_user.dart';

class MyLibraryMainAppBar extends StatelessWidget {
  const MyLibraryMainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      snap: false,
      floating: false,
      pinned: true,
      expandedHeight: 100,
      toolbarHeight: 100,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40), // 탭바의 높이 설정
        child: Container(
          color: Colors.white, // 탭바 배경색
          child: MyLibraryMainAppBarTabs(),
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: MyLibraryMainAppBarUser(
            username: "룰룰루", userUrlPic: "assets/user_images/avatar.png"),
      ),
    );
  }
}
