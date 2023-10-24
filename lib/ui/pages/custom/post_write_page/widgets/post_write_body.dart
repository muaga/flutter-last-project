import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class PostWriteBody extends StatefulWidget {
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
          // 제목 입력란
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: TextFormField(
                style: title1(),
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "제목을 입력하세요.",
                    hintStyle: title1(mColor: kFontGray)),
                maxLines: null,
                maxLength: 80,
              ),
            ),
          ),
          // Summernote 에디터
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: FlutterSummernote(
                hint: '내용을 입력해주세요',
                key: _keyEditor,
                hasAttachment: true,
                customToolbar: """
                  [
                    ['font', ['fontsize', 'backcolor']],
                    ['style', ['bold', 'underline', 'italic']],
                    ['insert', ['link','picture', 'hr']]
                  ]
                """,
              ),
            ),
          ),
          // 저장 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final title = titleController.text;
                final body = await _keyEditor.currentState?.getText();
                // 이제 'title'과 'body'를 서버로 보낼 수 있습니다.
                // 데이터 제출 또는 API 호출을 처리하세요.
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
