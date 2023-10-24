import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_review_card.dart';
import 'package:flutter_blog/ui/widgets/custom_review_insert.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class PostDetailBody extends StatelessWidget {
  const PostDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: ListView(
        children: [
          Text(
            "[밀리의 발견]말 많은 소녀, 오늘 밤엔 내 침대에서 잘 수 있어!",
            style: title1(),
          ),
          SizedBox(height: gapXxlarge),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: gapXlarge,
                        width: gapXlarge,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/user_images/avatar.png"),
                        ),
                      ),
                      SizedBox(width: gapSmall),
                      Text(
                        "말 많은 소녀",
                        style: body1(),
                      ),
                      SizedBox(width: gapSmall),
                      Text(
                        "2023.03.07",
                        style: body1(),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "팔로우",
                    style: TextStyle(
                      color: Colors.white, // 글자색
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black, // 버튼의 배경색
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: gapXlarge),

          /// 서머노트 시작
          Container(
            width: double.infinity, // 컨테이너의 너비를 화면 너비로 설정
            height: 200, // 컨테이너의 높이를 원하는 크기로 설정
            child: Image(
              image: AssetImage("assets/book_images/book1.png"),
              fit: BoxFit.cover, // 이미지가 컨테이너에 꽉 차도록 설정
            ),
          ),
          SizedBox(height: gapXxlarge),
          CustomThinLine(),
          SizedBox(height: gapXlarge),
          Container(
            width: double.infinity, // 컨테이너의 너비를 화면 너비로 설정
            height: 500, // 컨테이너의 높이를 원하는 크기로 설정
            child: Image(
              image: AssetImage("assets/book_images/book2.png"),
              fit: BoxFit.cover, // 이미지가 컨테이너에 꽉 차도록 설정
            ),
          ),
          SizedBox(height: gapXxlarge),
          Text(
            "잘 읽는 여러분 안녕하세요?\n"
            "유튜버 ‘말많은소녀’입니다.\n"
            "4년 전, 친구를 만나러 가로수길에 갔다가 우연히 골목 안에 있는 작은 카페에 들렀습니다. 커피가 다 거기서 거기 아닌가 생각했던 저였지만 그 집은 뭔가 메뉴가 상세한 거예요. 그래서인지 평소와 다르게 특별한 걸 먹어보고 싶어졌어요. 여기서 가장 맛있는 메뉴가 뭐냐고 묻자 카운터에 있던 카페 주인장은 상기된 채 향과 맛이 일품인 고급 원두에 대해 설명하기 시작했습니다. 꽃향기, 과실 향, 허브향을 커피에서도 느낄 수 있다고 말하는 그 눈빛이 얼마나 반짝이던지 커피에 대해 잘 몰랐던 저는 그의 말에 매료되어 난생처음 ‘게이샤 원두’를 맛보았습니다.그 후로도 좋은 커피를 생각하면 늘 그 카페가 생각났습니다. 향긋하고 쌉쌀한 게이샤 커피도 좋았지만,  그보다도 한 봉지에 수십만 원에 달하는 원두를 경매로 구해서 정성스레 커피를 내리는 그 사장님의 ‘열의’가 마음에 깊게 남았거든요.",
          ),

          /// 서머노트 끝

          SizedBox(height: gapXxlarge),
          Column(
            children: [
              Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // 테두리 색상
                    width: 1.0, // 테두리 두께
                  ),
                  borderRadius: BorderRadius.circular(30), // 테두리 모서리를 둥글게 만듭니다.
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: iconEmptyHeart(),
                    ),
                    Text("76"),
                  ],
                ),
              ),
              SizedBox(height: gapMedium),
              InkWell(
                onTap: () {},
                child: Text(
                  "이 포스트를 좋아하는 사람들",
                  style: body1(mColor: kFontGray),
                ),
              ),
              SizedBox(height: gapXxlarge),
            ],
          ),
          CustomReviewInsert(),
          CustomThinLine(),
          CustomReviewCard(
              username: "배트맨", writeAt: "2023.10.22", review: "asd"),
          CustomReviewCard(
              username: "아연맨",
              writeAt: "2023.10.21",
              review: "오늘 하루 되는게 하나도 없어 힘들었는데 많은 위로 받고 갑니다."),
          CustomReviewCard(
              username: "북방조개",
              writeAt: "2023.10.21",
              review: "나도 커피 한 잔 하고 싶네요"),
        ],
      ),
    );
  }
}
