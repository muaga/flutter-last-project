import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_tab_bar_view.dart';

class MyLibraryMainBody extends StatelessWidget {
  const MyLibraryMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    User user = User(
        id: 1,
        username: "ssar",
        email: "ssar@nate.com",
        nickname: "유재석",
        picUrl: "user1.png",
        createdAt: "2023-10-10");

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          MyLibraryMainAppBar(user: user),
        ];
      },
      body: MyLibraryMainTabBarView(user: user),
    );
  }
}
