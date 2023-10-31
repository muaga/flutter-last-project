import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/widgets/custom_check_box.dart';

class CustomCheckBoxAndTitleForm extends StatelessWidget {
  const CustomCheckBoxAndTitleForm(
      {super.key,
      required this.color,
      this.scaleSize,
      required this.title,
      this.fontStyle});

  final Color color;
  final double? scaleSize;
  final String title;
  final TextStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: scaleSize ?? 0.8,
          child: CustomCheckBox(
            color: color,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: Text(
                  "${title}",
                  style: fontStyle ?? subTitle3(mFontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
