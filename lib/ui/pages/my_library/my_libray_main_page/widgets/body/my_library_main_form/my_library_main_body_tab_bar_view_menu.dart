import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/body/my_library_main_form/my_library_main_body_image_delete.dart';

class MyLibraryMainBodyTabBarViewMenu extends StatelessWidget {
  const MyLibraryMainBodyTabBarViewMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return MyLibraryMainBodyImageDelete(book: book);
      },
    );
  }
}
