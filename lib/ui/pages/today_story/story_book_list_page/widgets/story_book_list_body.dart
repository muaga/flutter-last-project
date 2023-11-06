import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/scroll_view/Custom_book_grid_view.dart';

class StoryBookListBody extends StatelessWidget {
  const StoryBookListBody({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return CustomBookGridView(
      books: books,
    );
  }
}
