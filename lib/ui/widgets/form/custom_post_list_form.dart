import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/board.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class CustomPostListForm extends StatelessWidget {
  const CustomPostListForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Board> boards = [
      Board(
          id: 1,
          title: "벤자민 하디의 퓨처셀프",
          content:
              "그동안 주춤했던 뇌를 깨우고 싶거나, 나를 성장시키고 싶으신 분들, 또는 자기 계발의 실질적 행동 지침이 필요하신 분들!! 이 책을 추천드립니다",
          createdAt: "2023-10-10",
          picUrl: "book2.png",
          userId: 1,
          bookId: 2),
      Board(
          id: 2,
          title: "나를 사랑하지 못하는 나에게 / 안드레아스 크누프",
          content:
              "그동안 주춤했던 뇌를 깨우고 싶거나, 나를 성장시키고 싶으신 분들, 또는 자기 계발의 실질적 행동 지침이 필요하신 분들!! 이 책을 추천드립니다",
          createdAt: "2023-10-10",
          picUrl: "book5.png",
          userId: 2,
          bookId: 5),
      Board(
          id: 3,
          title: "설자은, 금성으로 돌아오다",
          content:
              "그동안 주춤했던 뇌를 깨우고 싶거나, 나를 성장시키고 싶으신 분들, 또는 자기 계발의 실질적 행동 지침이 필요하신 분들!! 이 책을 추천드립니다",
          createdAt: "2023-10-10",
          picUrl: "book6.png",
          userId: 3,
          bookId: 6),
    ];

    List<User> users = [
      User(
          id: 1,
          username: "ssar",
          email: "ssar@nate.com",
          nickname: "유재석",
          picUrl: "user1.png",
          createdAt: "2023-10-10"),
      User(
          id: 2,
          username: "ssar1",
          email: "ssar1@nate.com",
          nickname: "박명수",
          picUrl: "user2.png",
          createdAt: "2023-10-10"),
      User(
          id: 3,
          username: "ssar2",
          email: "ssar2@nate.com",
          nickname: "하동훈",
          picUrl: "user3.png",
          createdAt: "2023-10-10"),
      User(
          id: 4,
          username: "cos",
          email: "cos@nate.com",
          nickname: "정준하",
          picUrl: "user4.png",
          createdAt: "2023-10-10"),
      User(
          id: 5,
          username: "cos1",
          email: "cos1@nate.com",
          nickname: "정형돈",
          picUrl: "user5.png",
          createdAt: "2023-10-10"),
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: boards.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            int? boardId = boards[index].id;

            /// TODO 은혜 : 게시물 상세보기로 이동 경로 짜기
          },
          child: Container(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: gapXlarge, vertical: gapMain),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        "http://192.168.0.37:8080/images/${boards[index].picUrl}",
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8),
                        BlendMode.srcATop,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // 그림자의 색상
                        offset: Offset(0, 1), // 그림자의 위치 (x, y)
                        blurRadius: 5.0, // 그림자의 흐림 정도
                        spreadRadius: 1.0, // 그림자의 확산 정도
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: gapMain, horizontal: gapLarge),
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://192.168.0.37:8080/images/${boards[index].picUrl}",
                      fit: BoxFit.contain,
                      placeholder: (context, url) => CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kBackWhite,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kBackGray, // 그림자의 색상
                        offset: Offset(0, 1), // 그림자의 위치 (x, y)
                        blurRadius: 5.0, // 그림자의 흐림 정도
                        spreadRadius: 1.0, // 그림자의 확산 정도
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(gapMain),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: gapMain),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(boards[index].title,
                                  style: subTitle3(),
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(height: gapSmall),
                              Text(boards[index].content,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        CustomThinLine(),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/book8.png")),
                          title: Text("yuns의 서재"),
                          titleTextStyle:
                              subTitle3(mFontWeight: FontWeight.w500),
                          subtitle: Text("${boards[index].createdAt}"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
