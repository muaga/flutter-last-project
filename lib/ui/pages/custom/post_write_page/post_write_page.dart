import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_book_recommend_page.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_book_recommend_page/post_write_recommend-book-card.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/app_bar/post_write_show_dialog.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_title_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:logger/logger.dart';

class PostWritePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final content = TextEditingController();
  Book? selectedBook;

  PostWritePage({this.selectedBook, Key? key}) : super(key: key);

  @override
  _PostWritePageState createState() => _PostWritePageState();
}

class _PostWritePageState extends State<PostWritePage> {
  String _saveTitle = "";
  String _saveContent = "";

  @override
  void initState() {
    super.initState();

    // 이전에 저장된 텍스트가 있으면 불러옴
    widget.title.text = _saveTitle;
    widget.content.text = _saveContent;
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.popAndPushNamed(context, Move.MyLibraryMainPage);
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
                    onChanged: (text) {
                      setState(() {
                        _saveTitle = text;
                      });
                    }),
                CustomThinLine(),
                CustomTextArea(
                  controller: widget.content,
                  hint: "내용을 입력하세요",
                  funValidator: validateContent(),
                  onChanged: (text) {
                    setState(() {
                      _saveContent = text;
                    });
                  },
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
                            ? PostWriteRecommendBookCard(widget.selectedBook)
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
                              onPressed: () async {
                                widget.selectedBook = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PostWriteBookRecommendPage(
                                            selectedBook:
                                                null), // 선택한 책 정보를 초기화
                                  ),
                                );

                                if (widget.selectedBook != null) {
                                  // 선택한 책을 사용하여 원하는 작업을 수행
                                  // selectedBook를 사용하여 처리
                                }
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
