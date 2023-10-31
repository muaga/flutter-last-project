import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/body/book_store_best_book_list_body.dart';

class BookStoreBestBookListPage extends StatelessWidget {
  const BookStoreBestBookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("지금! 서점 베스트"),
      ),
      bottomNavigationBar: MillieBottomNavigationBar(),
      body: BookStoreBestBookListBody(),
    );
  }
}
