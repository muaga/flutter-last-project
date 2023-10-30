import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_tab_bar_menu.dart';

class MyLibraryMainAppBarTabs extends StatelessWidget {
  const MyLibraryMainAppBarTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        CustomTabBarMenu(tabBarText: "좋아하는 책"),
        CustomTabBarMenu(tabBarText: "책장"),
        CustomTabBarMenu(tabBarText: "독서노트"),
      ],
    );
  }
}
