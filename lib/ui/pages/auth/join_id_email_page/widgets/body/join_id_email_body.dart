import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/out_line_text_form_field.dart';

class JoinIdEmailBody extends StatelessWidget {
  const JoinIdEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(gapMain),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("아이디 입력",
    style: subTitle1(),),
        SizedBox(height: gapMedium),

        Row(
          children: [
            Container(
            width: 250,
                child: OutLineTextFormField(hintText: "아이디 입력")),
                        SizedBox(width: gapMedium),
                        ElevatedButton(onPressed: (){}, child: Text("중복체크"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  minimumSize: Size(60, 60),
                )
            ),
          ],
        ),

      ],
    ),);
  }
}
