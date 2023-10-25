import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/custom/post_write_page/widgets/form/post_write_form.dart';
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
      child: PostWriteForm(titleController: titleController, keyEditor: _keyEditor),
    );
  }
}



