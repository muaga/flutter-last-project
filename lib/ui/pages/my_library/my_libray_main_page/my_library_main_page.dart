import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/body/my_library_main_body.dart';

class MyLibraryMainPage extends StatelessWidget {
  const MyLibraryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: null,
        body: MyLibraryMainBody(),
      ),
    );
  }
}
