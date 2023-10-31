import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';

class MyLibraryMainTabBarView extends StatelessWidget {
  final User user;
  const MyLibraryMainTabBarView({required this.user});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CustomBookGridView(),
        CustomBookGridView(),
        CustomBookGridView(),
      ],
    );
  }
}
