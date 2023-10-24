import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/millie_bottom_navigation_bar.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/body/book_detail_body.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetailPage extends ConsumerWidget {
  final int bookId;
  const BookDetailPage({required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetailModel = ref.watch(bookDetailProvider(bookId));
    Book book;
    if (bookDetailModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      book = bookDetailModel.book;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(""),
        actions: [
          IconButton(
            onPressed: () {},
            icon: iconEmptyStar(),
          ),
          IconButton(
            onPressed: () {},
            icon: iconDotMenu(),
          )
        ],
      ),
      bottomNavigationBar: MillieBottomNavigationBar(),
      body: BookDetailBody(book: book),
    );
  }
}
