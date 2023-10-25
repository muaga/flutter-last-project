import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_like_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/form/post_detail_one_review_form.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_title.dart';
import 'package:flutter_blog/ui/pages/custom/post_detail_page/widgets/post_detail_writer.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class PostDetailBody extends StatelessWidget {
  const PostDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          PostDetailTitle(),
          SizedBox(height: gapXxlarge),
          PostDetailWriter(),
          SizedBox(height: gapXlarge),
          CustomThinLine(),
          SizedBox(height: gapXlarge),
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.green,
            child: Text(
              "이 자리에 서머노트 내용 들어와야함",
              style: title1(mColor: Colors.black),
            ),
          ),
          SizedBox(height: gapXxlarge),
          PostDetailLikeForm(),
          PostDetailOneReviewForm(),
        ],
      ),
    );
  }
}




