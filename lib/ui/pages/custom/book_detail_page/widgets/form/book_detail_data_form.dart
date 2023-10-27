import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_data_info.dart';

class BookDetailDataForm extends StatelessWidget {
  const BookDetailDataForm({required this.book});

  final BookDetailModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: kBackLightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: CustomDataInfo(
                dataTitle: "카테고리",
                dataContent: book.bookCategory?.categoryName ?? "카테고리 정보 없음"),
          ),
          Container(height: gapXlarge, width: 1, color: Colors.grey),
          Expanded(
              child: CustomDataInfo(
                  dataTitle: "페이지", dataContent: book.totalPage)),
          Container(height: gapXlarge, width: 1, color: Colors.grey),
          Expanded(
            child: CustomDataInfo(
                dataTitle: "출간일",
                // dataContent: book.publicationDate.toLocal().toString()),
                dataContent: "${book.publicationDate}"),
          ),
        ],
      ),
    );
  }
}
