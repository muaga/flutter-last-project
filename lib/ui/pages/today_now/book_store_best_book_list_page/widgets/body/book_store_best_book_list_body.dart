import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/view-model/book_store_best_book_view_list_model.dart';
import 'package:flutter_blog/ui/widgets/form/custom_category_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStoreBestBookListBody extends ConsumerWidget {
  const BookStoreBestBookListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookStoreBestBookListModel? model = ref.watch(bookStoreBestProvider);
    List<Book> books = [];
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      books = model.books;
    }

    return CustomCategoryForm(books: books);
  }
}
