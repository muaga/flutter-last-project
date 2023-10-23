import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_expandable_description.dart';

class BookDetailSubInfoForm extends StatelessWidget {
  const BookDetailSubInfoForm({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookDetailExpandableDescription(
          title: "목차",
          description: "프롤로그\n"
              "\n"
              "1. 나무와 껍질\n"
              "2. 잎사귀\n"
              "3. 꽃\n"
              "4. 열매\n"
              "5. 수액\n"
              "6. 씨앗\n"
              "7. 뿌리\n",
        ),
        BookDetailExpandableDescription(
            title: "저자 소개",
            description: "지은이_ ${book.writer}\n"
                "\n"
                "전 세계적으로 손꼽히는 마스터 조향사이자 조향계의 살아 있는 전설. 1947년 프랑스 남부에 위치한 향수의 본고장 그라스에서 태어났다. 17세에 스위스 제네바의 향수전문학교인 지보당Givaudan에 입학했으며 그라스의 최대 향수 회사인 앙투안 쉬리Antoine Chiris의 조교를 거쳐, 이후 전 세계인들에게 사랑받는 매혹적인 향의 연금술사가 되었다. 14년 동안 에르메스 전속 조향사로 지내며 에르메스 향의 세계를 구축하다가 2018년부터 독립 조향사로서 70대인 지금도 활발히 활동하고 있다.\n"),
        BookDetailExpandableDescription(
            title: "출판사 서평",
            description: "<보그닷컴> 선정 ‘2022 선물하기 좋은 최고의 책’\n"
                "<파이낸셜 타임즈> 선정 ‘막솔로지스트를 위한 16가지 선물’\n"
                "60년 동안 조향사로 활동한 저자의 가장 매력적인 향 입문서\n"
                "에르메스 스타일의 가장 우아하고 고급스러운 한국판 양장본\n"),
      ],
    );
  }
}
