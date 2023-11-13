import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainBookcase extends ConsumerStatefulWidget {
  const MyLibraryMainBookcase({super.key});

  @override
  _MyLibraryMainBookcaseState createState() => _MyLibraryMainBookcaseState();
}

class _MyLibraryMainBookcaseState extends ConsumerState<MyLibraryMainBookcase> {
  @override
  Widget build(BuildContext context) {
    MyLibraryModel? model = ref.watch(myLibraryProvider);
    List<ReadingBookDTO>? readingBookList = model?.readingBookList;
    SessionUser sessionUser = ref.read(sessionStore);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("책장"),
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
            itemCount: readingBookList?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  int? bookId = readingBookList?[index].bookId;
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
                          "책장에서 정리할까요?",
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
                                    backgroundColor: kRed, // 배경색
                                    minimumSize: Size(130, 50)),
                                onPressed: () async {
                                  await ref
                                      .read(myLibraryProvider.notifier)
                                      .readingBookDelete(
                                          readingBookList![index].bookId!);
                                  Navigator.of(context).pop(); // 알림창 닫기
                                },
                                child: Text(
                                  '해제',
                                  style: subTitle3(mColor: kFontWhite),
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
                  title: readingBookList![index].bookReadingTitle,
                  writer: readingBookList![index].readingWriter,
                  picUrl: readingBookList![index].bookReadingPicUrl,
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
