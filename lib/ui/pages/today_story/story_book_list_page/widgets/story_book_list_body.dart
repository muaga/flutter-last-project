import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/Custom_book_grid_view.dart';

class StoryBookListBody extends StatelessWidget {
  const StoryBookListBody({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: gapXlarge, vertical: gapMain),
            child: Text("총 ${books.length}권", style: subTitle2())),
        CustomThinLine(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: gapMain),
            child: CustomBookGridView(
              books: books,
            ),
          ),
        ),
      ],
    );
  }
}
