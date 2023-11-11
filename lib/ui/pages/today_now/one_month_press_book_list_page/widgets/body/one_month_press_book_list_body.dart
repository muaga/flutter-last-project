import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_now/one_month_press_book_list_page/widgets/form/one_month_book_category_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneMonthPressBookListBody extends ConsumerWidget {
  const OneMonthPressBookListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OneMonthCategoryForm();
  }
}
