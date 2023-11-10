import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/view-model/one_month_press_book_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/form/custom_category_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneMonthPressBookListBody extends ConsumerWidget {
  const OneMonthPressBookListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 화면 초기값
    final int categoryId = 1;
    final String alignment = "ranking";

    BookReqDTO dto =
        BookReqDTO(bookCategowryId: categoryId, alignment: alignment);

    OneMonthPressBookListModel? model =
        ref.watch(OneMonthPressBookListProvider(dto));
    List<Book> books = [];
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      books = model.books;
    }
    return CustomCategoryForm(books: books);
  }
}
