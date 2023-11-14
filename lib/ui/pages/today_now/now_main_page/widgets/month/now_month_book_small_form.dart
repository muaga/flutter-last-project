import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/now_small_book_card.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';

class NowMonthBookSmallForm extends StatelessWidget {
  const NowMonthBookSmallForm({super.key, required this.books});

  final List<BookListDTO> books;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gapMain),
        child: Container(
          height: getScreenWidth(context) * 0.55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemExtent: 120,
            itemBuilder: (context, index) {
              return NowSmallBookCard(book: books[index + 2]);
            },
          ),
        ),
      ),
    );
  }
}
