import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_title_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class PostWriteForm extends StatelessWidget {
  const PostWriteForm({
    super.key,
    required this.titleController,
    required GlobalKey<FlutterSummernoteState> keyEditor,
  }) : _keyEditor = keyEditor;

  final TextEditingController titleController;
  final GlobalKey<FlutterSummernoteState> _keyEditor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        children: [
          // 제목 입력란
          CustomTitleInsert(
              titleController: titleController, hintText: "제목을 입력하세요"),
          CustomThinLine(),
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "내용을 입력하세요"),
            maxLines: 10,
            style: subTitle1(),
          ),
        ],
      ),
    );
  }
}
