import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_title_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteForm extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final content = TextEditingController();

  PostWriteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            // 제목 입력란
            CustomTitleInsert(titleController: title, hintText: "제목을 입력하세요"),
            CustomThinLine(),
            CustomTextArea(
              controller: content,
              hint: "내용을 입력하세요",
              funValidator: validateContent(),
            ),
          ],
        ),
      ),
    );
  }
}
