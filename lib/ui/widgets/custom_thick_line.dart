import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomThickLine extends StatelessWidget {
  const CustomThickLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: gapMedium,
      decoration: BoxDecoration(
        color: kBackLightGray,
      ),
    );
  }
}
