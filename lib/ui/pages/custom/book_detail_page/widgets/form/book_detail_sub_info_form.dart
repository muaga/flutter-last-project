import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_expandable_description.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';

class BookDetailSubInfoForm extends StatelessWidget {
  const BookDetailSubInfoForm({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookDetailModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// TODO 대욱 : 목차, 저자, 출판사 데이터
        BookDetailExpandableDescription(
            title: "목차", description: book.sequence),
        BookDetailExpandableDescription(
            title: "저자 소개",
            description: "지은이_ ${book.bookWriter}\n"
                "\n"
                "전 세계적으로 손꼽히는 마스터 조향사이자 조향계의 살아 있는 전설. 1947년 프랑스 남부에 위치한 향수의 본고장 그라스에서 태어났다. 17세에 스위스 제네바의 향수전문학교인 지보당Givaudan에 입학했으며 그라스의 최대 향수 회사인 앙투안 쉬리Antoine Chiris의 조교를 거쳐, 이후 전 세계인들에게 사랑받는 매혹적인 향의 연금술사가 되었다. 14년 동안 에르메스 전속 조향사로 지내며 에르메스 향의 세계를 구축하다가 2018년부터 독립 조향사로서 70대인 지금도 활발히 활동하고 있다.\n"),
        BookDetailExpandableDescription(
            title: "출판사 서평", description: book.review),
      ],
    );
  }
}
