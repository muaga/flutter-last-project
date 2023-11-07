import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/now_book_card.dart';

class NowMonthBookForm extends StatelessWidget {
  const NowMonthBookForm({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gapMain),
        child: Container(
          height: getScreenWidth(context) * 0.7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemExtent: 150,
            itemBuilder: (context, index) {
              return NowBookCard(book: books[index]);
            },
          ),
        ),
      ),
    );
  }
}