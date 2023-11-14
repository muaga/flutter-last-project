import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/book_like_request_dto.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/body/book_detail_body.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/custom/book_read_page/book_read_page.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/store/session_user.dart';

class BookDetailPage extends ConsumerWidget {
  final int bookId;
  const BookDetailPage({required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 로그인 유무
    final SessionUser sessionUser = ref.read(sessionStore);

    // 책 정보 검색
    final bookDetailModel = ref.watch(bookDetailProvider(bookId));

    BookDetailModel book;
    if (bookDetailModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      book = bookDetailModel; // book 변수를 초기화
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        actions: [
          IconButton(
            onPressed: () async {
              if (sessionUser.isLogin == true) {
                BookLikeReqDTO dto = BookLikeReqDTO(
                    userId: sessionUser.user!.id, bookId: bookId);

                await ref
                    .read(bookDetailProvider(book.bookId).notifier)
                    .bookLikeWrite(dto);

                BookDetailModel? model =
                    ref.watch(bookDetailProvider(book.bookId));

                if (book.bookLike == 1) {
                  LikeListDTO likeListDTO = LikeListDTO(
                      bookLikeId: model!.bookLike,
                      bookLikeUserId: sessionUser.user!.id,
                      bookId: bookId,
                      likeBookPicUrl: model.bookPicUrl,
                      likeBookTitle: model.bookTitle,
                      likeWriter: model.bookWriter);
                  await ref
                      .read(myLibraryProvider.notifier)
                      .bookLikeNotify(likeListDTO);
                } else {
                  await ref
                      .read(myLibraryProvider.notifier)
                      .bookLikeDeleteNotify(book.bookId);
                }
              }
            },
            icon: book.bookLike == 1
                ? iconFullStar(mColor: kPrimaryColor)
                : iconEmptyStar(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(gapMain),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () async {
                    final bookId = book.bookId;
                    final securePage =
                        await secureStorage.read(key: "currentPage");
                    final previousPage =
                        int.parse(securePage?.split('.')[0] ?? '0');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookReadPage(
                              bookId: bookId, previousPage: previousPage)),
                    );
                  },
                  child: Text(
                    "바로읽기",
                    style: subTitle1(mColor: kFontWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BookDetailBody(book: book, sessionUser: sessionUser),
    );
  }
}
