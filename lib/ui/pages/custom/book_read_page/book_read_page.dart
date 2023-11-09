import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/body/book_read_body.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_drawer.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookReadPage extends ConsumerStatefulWidget {
  BookReadPage({required this.bookId, this.previousPage = 0});

  final int bookId;
  final previousPage;

  @override
  _BookReadPageState createState() => _BookReadPageState();
}

class _BookReadPageState extends ConsumerState<BookReadPage> {
  late PageController pageController;
  int currentPage = 0; // index
  double sliderValue = 0.0; // index
  int savedPage = 0;
  bool isAppBarvisible = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.previousPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void toggleAppBarVisibility() {
    setState(() {
      isAppBarvisible = !isAppBarvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookModel = ref.watch(bookDetailProvider(widget.bookId));
    final bookDataModel = ref.watch(bookReadProvider(widget.bookId));
    BookReadModel bookData;
    BookDetailModel book;
    if (bookDataModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      bookData = bookDataModel;
    }
    if (bookModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      book = bookModel;
    }

    int totalPages = bookData.bookdata.length; // 전체 페이지 수
    // int currentPage = pageController.page!.toInt();

    return Scaffold(
      endDrawer: BookReadDrawer(
          bookModel: book!, bookData: bookData, pageController: pageController),
      body: GestureDetector(
        onTap: toggleAppBarVisibility,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: BookReadBody(
                  bookData: bookData!,
                  pageController: pageController,
                  currentPage: currentPage,
                  savedPage: savedPage,
                  sliderValue: sliderValue,
                  totalPages: totalPages),
            ),
            Visibility(
              visible: isAppBarvisible,
              child: Positioned(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      icon: iconArrowBack(),
                      onPressed: () async {
                        double? lastPage = pageController.page;
                        int lastPageInt = lastPage!.toInt();
                        await secureStorage.write(
                            key: 'currentPage', value: lastPageInt.toString());
                        final value =
                            await secureStorage.read(key: 'currentPage');
                        Logger().d("저장됨 : ${value}");
                        Navigator.pop(context);
                      }),
                  actions: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            // 슬라이더 값을 초기화
                            sliderValue = pageController.page!;
                            Logger().d("sliderValue : ${sliderValue}");

                            // 현재 페이지를 북마크로 저장
                            savedPage = sliderValue.toInt();
                            Logger().d(savedPage);
                          });
                        },
                        icon: iconBookMartOutline()),
                    EndDrawerButton()
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isAppBarvisible,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BookReadBottomAppBar(
                    pageController: pageController,
                    currentPage: currentPage,
                    savedPage: savedPage,
                    sliderValue: sliderValue,
                    totalPages: totalPages),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
