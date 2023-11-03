import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/form/now_title_and_forward_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/form/now_image_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/form/now_text_slider_form.dart';
import 'package:logger/logger.dart';

class NowMainBody extends StatefulWidget {
  const NowMainBody({super.key});

  @override
  State<NowMainBody> createState() => _NowMainBodyState();
}

class _NowMainBodyState extends State<NowMainBody> {
  // 슬라이더 초기 번호
  int current = 0;
  // AppBar 초기 아이템 컬러
  Color currentColor = kFontWhite;
  // 컨트롤러
  final CarouselController _imageController = CarouselController();
  final CarouselController _textController = CarouselController();
  final ScrollController _scrollController = ScrollController();

  List<String> imageList = [
    "ad_moon.jpg",
    "ad_november.jpg",
    "ad_higasino_geigo.jpg",
    // "ad_story_1.jpg",
    // "ad_story_2.jpg",
    // "ad_story_3.jpg"
  ];

  List<String> textList = [
    "내 딸이 달에게 납치되었다?\n상상력을 자극하는 '달의 아이' 공개",
    "11월에는 어떤 책을 읽지?\n추천 맛집! 에디터의 선택",
    "히가시노 게이고 뭐부터 읽지?\n나의 소설 취향 소설보기",
    // "입대전 마지막으로 떠난 여행\n난 각성자가 되었다",
    // "조직에 배신당한 히트맨\n암살 당해 죽고 회귀했다",
    // "뚱보 김병장이 재능 만랩\n엔터테이너로 거듭난다"
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 100) {
        // 스크롤 위치에 따라 타이틀 변경
        setState(() {
          currentColor = kFontBlack;
        });
      } else {
        setState(() {
          currentColor = kFontWhite;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Image(
                  image: AssetImage("assets/logos/millie_logo_black.png"),
                  color: currentColor),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    // TODO 은혜 : Now 화면으로 넘어오기
                  },
                  child: Text("NOW",
                      style: title1(
                          mFontWeight: FontWeight.bold, mColor: currentColor))),
              TextButton(
                  onPressed: () {
                    // TODO 은혜 : 스토리 화면으로 넘어가기
                  },
                  child: Text("스토리",
                      style: subTitle2(
                          mFontWeight: FontWeight.bold, mColor: currentColor))),
            ],
            leadingWidth: 70,
            expandedHeight: 250,
            backgroundColor: Colors.white,
            pinned: true,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: getScreenWidth(context) + kToolbarHeight,
                width: getScreenWidth(context),
                // ),
                child: Stack(
                  children: [
                    ImageSliderForm(
                        imageController: _imageController,
                        imageList: imageList,
                        current: current),
                    TextSliderForm(
                        textController: _textController,
                        textList: textList,
                        current: current)
                    // sliderIndicator(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: gapMedium)),
          SliverToBoxAdapter(
              child: Column(
            children: [
              NowTitleAndForwardForm(),
            ],
          ))
        ],
      ),
    );
  }
}
