import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/form/post_write_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/post_write_recommend-book-card.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class PostWriteBody extends StatefulWidget {
  final Book? selectedBook;

  PostWriteBody({this.selectedBook, Key? key}) : super(key: key);

  @override
  _PostWriteBodyState createState() => _PostWriteBodyState();
}

class _PostWriteBodyState extends State<PostWriteBody> {
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostWriteForm(
            titleController: titleController,
            keyEditor: _keyEditor,
          ),
          if (widget.selectedBook != null)
            Container(
              width: getScreenWidth(context),
              height: 600,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "선택한 책 정보:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                      width: getScreenWidth(context) / 3,
                      height: 300,
                      child: PostWriteRecommendBookCard(widget.selectedBook!))
                  // 여기에 선택한 책의 추가 정보를 표시할 수 있습니다.
                ],
              ),
            ),
        ],
      ),
    );
  }
}
