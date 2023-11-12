import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/book_store_best_book_list_page/widgets/form/book_store_best_book_category_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStoreBestBookListBody extends ConsumerWidget {
  const BookStoreBestBookListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BookStoreBestBookCategoryForm();
  }
}
