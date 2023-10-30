import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/body/my_library_main_body.dart';

class MyLibraryMainPage extends StatelessWidget {
  const MyLibraryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: null,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              MyLibraryMainAppBar(),
            ];
          },
          body: MyLibraryMainBody(user: user),
        ),
        bottomNavigationBar: MillieBottomNavigationBar(),
      ),
    );
  }
}
