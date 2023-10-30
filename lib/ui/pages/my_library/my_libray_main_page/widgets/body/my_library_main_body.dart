import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/custom_book_grid_view.dart';

class MyLibraryMainBody extends StatelessWidget {
  final User user;
  const MyLibraryMainBody({required this.user});

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
