import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class NowTitleForm extends StatelessWidget {
  const NowTitleForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child: Container(
        height: 56,
        child: Text(
          "놓치기 아쉬운 소식!",
          style: subTitle1(),
        ),
      ),
    );
  }
}
