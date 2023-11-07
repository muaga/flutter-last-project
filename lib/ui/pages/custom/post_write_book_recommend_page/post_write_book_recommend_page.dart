import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/post_write_page.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';
import 'package:logger/logger.dart';
import 'package:toast/toast.dart';

class PostWriteBookRecommendPage extends StatefulWidget {
  Book? selectedBook; // 선택한 책을 저장하는 프로퍼티
  final String? writingTitle;
  final String? writingContent;
  final title = TextEditingController();
  final content = TextEditingController();

  PostWriteBookRecommendPage(
      {this.selectedBook, this.writingTitle, this.writingContent, Key? key})
      : super(key: key);

  @override
  _PostWriteBookRecommendPageState createState() =>
      _PostWriteBookRecommendPageState();
}

class _PostWriteBookRecommendPageState
    extends State<PostWriteBookRecommendPage> {
  @override
  void initState() {
    super.initState();
    widget.title.text = widget.writingTitle!; // 이전 페이지에서 받은 텍스트 설정
    widget.content.text = widget.writingContent!; // 이전 페이지에서 받은 텍스트 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(),
        ),
        title: Text("책 추천하기"),
      ),
      body: Container(
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
          itemCount: books.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (widget.selectedBook == books[index]) {
                  // 이미 선택한 책을 다시 탭하면 선택 해제
                  widget.selectedBook = null;
                  setState(() {});
                } else {
                  // 새로운 책 선택
                  widget.selectedBook = books[index];
                  setState(() {});
                }
              },
              child: CustomGridBookCard(book: books[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.selectedBook != null)
              Padding(
                padding: EdgeInsets.only(top: gapMain),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("선택한 책 : ",
                        style: subTitle2(mFontWeight: FontWeight.normal)),
                    Text("${widget.selectedBook?.title}",
                        style: subTitle2(
                            mColor: kPointColor,
                            mFontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(gapMain),
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "title": widget.title.text,
                      "content": widget.content.text
                    });
                  },
                  child: Text(
                    "책 추천하기",
                    style: subTitle1(mColor: kFontBlack),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
