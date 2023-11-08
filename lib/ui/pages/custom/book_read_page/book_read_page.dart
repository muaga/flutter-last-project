import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/body/book_read_body.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_drawer.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookReadPage extends ConsumerStatefulWidget {
  const BookReadPage({Key? key}) : super(key: key);


  @override
  _BookReadPageState createState() => _BookReadPageState();
}

class _BookReadPageState extends ConsumerState<BookReadPage> {
  late PageController pageController;
  int currentPage = 0;
  double sliderValue = 0.0;
  int savedPage = -1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BookReadModel model = ref.read(bookReadProvider(bookId))
    int totalPages = 100; // 전체 페이지 수

    return Scaffold(
      endDrawer: BookReadDrawer(),
      body: BookReadBody(
          pageController: pageController,
          currentPage: currentPage,
          savedPage: savedPage,
          sliderValue: sliderValue,
          totalPages: totalPages),
      bottomNavigationBar: BookReadBottomAppBar(
          pageController: pageController,
          currentPage: currentPage,
          savedPage: savedPage,
          sliderValue: sliderValue,
          totalPages: totalPages),
    );
  }
}
