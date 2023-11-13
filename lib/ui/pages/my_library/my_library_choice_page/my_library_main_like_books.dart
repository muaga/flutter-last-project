import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/book_like_request_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainLikeBooks extends ConsumerStatefulWidget {
  const MyLibraryMainLikeBooks({super.key});

  @override
  _MyLibraryMainLikeBooksState createState() => _MyLibraryMainLikeBooksState();
}

class _MyLibraryMainLikeBooksState
    extends ConsumerState<MyLibraryMainLikeBooks> {
  @override
  Widget build(BuildContext context) {
    MyLibraryModel? model = ref.watch(myLibraryProvider);
    List<LikeListDTO>? likeBookList = model?.likeBookList;
    SessionUser sessionUser = ref.read(sessionStore);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("좋아하는 책"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: gapMain),
        child: Container(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 2,
            ),
            itemCount: likeBookList?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  int? bookId = likeBookList?[index].bookId;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            '알림',
                            style: subTitle1(mFontWeight: FontWeight.bold),
                          ),
                        ),
                        content: Text(
                          "북마크를 해제할까요?",
                          style: body1(mColor: kFontGray),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: kBackGray, // 배경색
                                    minimumSize: Size(130, 50)),
                                onPressed: () {
                                  Navigator.of(context).pop(); // 알림창 닫기
                                },
                                child: Text(
                                  '취소',
                                  style: subTitle3(mColor: kFontBlack),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: kPrimaryColor, // 배경색
                                    minimumSize: Size(130, 50)),
                                onPressed: () async {
                                  BookLikeReqDTO bookLikeDTO = BookLikeReqDTO(
                                      bookId: bookId!,
                                      userId: sessionUser.user!.id);
                                  await ref
                                      .read(myLibraryProvider.notifier)
                                      .bookLikeWrite(bookLikeDTO);
                                  Navigator.of(context).pop(); // 알림창 닫기
                                },
                                child: Text(
                                  '해제',
                                  style: subTitle3(mColor: kFontBlack),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CustomGridBookCard(
                  title: likeBookList![index].likeBookTitle,
                  writer: likeBookList![index].likeWriter,
                  picUrl: likeBookList![index].likeBookPicUrl,
                ),
              );
            },
            // 더 많은 리스트 아이템을 추가할 수 있습니다.
          ),
        ),
      ),
    );
  }
}
