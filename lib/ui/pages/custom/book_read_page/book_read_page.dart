import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/data/dto/request_dto/book_mark_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/body/book_read_body.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_bottom_app_bar.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/book_read_drawer.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/widgets/view_model/book_read_view_model.dart';
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
  late List<String> bookDataList = [];
  late List<BookMarkDTO> bookMarkList = [];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.previousPage);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      bookDataDetail(widget.bookId);
    }); // 최초 화면 생성 시 실행
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

  void bookDataDetail(int bookId) async {
    BookReadModel? model =
        await ref.watch(bookReadProvider(bookId).notifier).notifyInit(bookId);

    if (model != null) {
      setState(() {
        bookMarkList = model.bookMarkDTOList!;
        bookDataList = model.bookdata;
      });
    }
  }

  void bookMarkSave(int bookId, int page) async {
    SessionUser sessionUser = ref.read(sessionStore);
    BookMarkReqDTO bookMarkReqDTO = BookMarkReqDTO(
        userId: sessionUser.user!.id, bookId: bookId, scroll: page);
    await ref.read(bookReadProvider(bookId).notifier).bookMark(bookMarkReqDTO);
  }

  @override
  Widget build(BuildContext context) {
    BookDetailModel? bookModel = ref.watch(bookDetailProvider(widget.bookId));
    BookDetailModel book;

    if (bookModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      book = bookModel;
    }

    int totalPages = bookDataList.length; // 전체 페이지 수

    return Scaffold(
      endDrawer: BookReadDrawer(
          bookModel: book!,
          bookData: bookDataList,
          bookMarkList: bookMarkList,
          pageController: pageController),
      body: GestureDetector(
        onTap: toggleAppBarVisibility,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: BookReadBody(
                  bookData: bookDataList,
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
                        onPressed: () async {
                          setState(() {
                            // 슬라이더 값을 초기화
                            sliderValue = pageController.page!;

                            // 현재 페이지를 북마크로 저장
                            savedPage = sliderValue.toInt();
                          });

                          // 북마크 등록
                          bookMarkSave(widget.bookId, savedPage);
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
