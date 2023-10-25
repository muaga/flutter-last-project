import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class CustomSummernote extends StatelessWidget {
  const CustomSummernote({
    super.key,
    required GlobalKey<FlutterSummernoteState> keyEditor,
  }) : _keyEditor = keyEditor;

  final GlobalKey<FlutterSummernoteState> _keyEditor;

  @override
  Widget build(BuildContext context) {
    return FlutterSummernote(
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
    );
  }
}
