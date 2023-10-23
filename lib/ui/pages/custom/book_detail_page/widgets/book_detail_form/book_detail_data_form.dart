import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_data_info.dart';

class BookDetailDataForm extends StatelessWidget {
  const BookDetailDataForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: kBackLightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomDataInfo(dataTitle: "카테고리", dataContent: "라이프스타일"),
          Container(height: gapXlarge, width: 1, color: Colors.grey),
          CustomDataInfo(dataTitle: "페이지", dataContent: "228P"),
          Container(height: gapXlarge, width: 1, color: Colors.grey),
          CustomDataInfo(dataTitle: "출간일", dataContent: "2023.09.03"),
        ],
      ),
    );
  }
}
