import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/post_request_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_book_recommend_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_recommend-book-card.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/app_bar/post_write_show_dialog.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/post_write_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_title_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostWritePage extends ConsumerStatefulWidget {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final content = TextEditingController();
  final Book? selectedBook;
  final String? writingTitle;
  final String? writingContent;

  PostWritePage(
      {this.selectedBook, this.writingTitle, this.writingContent, Key? key})
      : super(key: key);

  @override
  _PostWritePageState createState() => _PostWritePageState();
}

class _PostWritePageState extends ConsumerState<PostWritePage> {
  // 초기값 설정
  @override
  void initState() {
    super.initState();

    // 이전에 저장된 텍스트가 있으면 불러와서
    // 현재 textFormField의 controller의 text에 넣으면 textFormField에 초기값처럼 들어간다
    if (widget.writingTitle != null) {
      widget.title.text = widget.writingTitle!;
    }
    if (widget.writingContent != null) {
      widget.content.text = widget.writingContent!;
    }
  }

  @override
  Widget build(BuildContext context) {
    SessionUser sessionUser = ref.read(sessionStore);

    return Form(
      key: widget.formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return PostWriteShowDialog();
                },
              );
            },
            icon: iconArrowBack(),
          ),
          title: Text("포스트", style: subTitle1()),
          actions: [
            TextButton(
              onPressed: () {
                Logger().d(widget.content);
                Navigator.popAndPushNamed(context, Move.MyLibraryMainPage);
                if (widget.formKey.currentState!.validate()) {
                  PostSaveReqDTO postSaveReqDTO = PostSaveReqDTO(
                      boardTitle: widget.title.text,
                      content: widget.content.text,
                      userId: sessionUser.user!.id,
                      bookId: widget.selectedBook?.id ?? null);
                  ref.read(postWriteProvider.notifier).savePost(postSaveReqDTO);
                }
              },
              child: Text(
                "발행",
                style: subTitle1(mColor: kPointColor),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(gapMain),
            child: Column(
              children: [
                CustomTitleInsert(
                  titleController: widget.title,
                  hintText: "제목을 입력하세요",
                ),
                CustomThinLine(),
                CustomTextArea(
                  controller: widget.content,
                  hint: "내용을 입력하세요",
                  funValidator: validateContent(),
                ),
                if (widget.selectedBook != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomThinLine(),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: gapMain),
                          child: Text("선택한 책 정보:",
                              style: subTitle2(mColor: kFontGray))),
                      Container(
                        width: getScreenWidth(context) / 3,
                        child: widget.selectedBook != null
                            ? PostWriteRecommendBookCard(
                                bookId: widget.selectedBook!.id,
                                bookPicUrl: widget.selectedBook!.picUrl,
                                bookTitle: widget.selectedBook!.title,
                                bookWriter: widget.selectedBook!.writer,
                              )
                            : Text(""),
                      )
                      // 여기에 선택한 책의 추가 정보를 표시할 수 있습니다.
                    ],
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BottomAppBar(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(gapMain),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "좋아하는 책을 추천해주세요",
                            style: body1(),
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostWriteBookRecommendPage(
                                              writingTitle: widget.title.text,
                                              writingContent:
                                                  widget.content.text,
                                            )));
                              },
                              child: Text(
                                "책 추천하기",
                                style: subTitle1(mColor: kFontWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
