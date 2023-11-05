import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/best_book_response_dto_test.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_image_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_text_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_book_slider.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_slider_indicator.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_title_and_forward_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/now_book_card.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/now_small_book_card.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';

class NowMainBody extends StatefulWidget {
  const NowMainBody({super.key});

  @override
  State<NowMainBody> createState() => _NowMainBodyState();
}

class _NowMainBodyState extends State<NowMainBody> {
  // 슬라이더 초기 번호
  int _bannerCurrent = 0;
  int _bestCurrent = 0;

  // AppBar 초기 아이템 컬러
  Color currentColor = kFontWhite;

  // 컨트롤러
  final CarouselController _imageController = CarouselController();
  final CarouselController _textController = CarouselController();
  final ScrollController _scrollController = ScrollController();
  final CarouselController _carouselController = CarouselController();

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

  List<testBook> rankingBooks = [
    testBook(
        id: 1,
        rankingId: 1,
        title: "트렌드 코리아 2024",
        writer: "김난도, 전미영, 최지혜, 이수진, 권정윤, 한다혜, 이준영, 이향은, 이혜원, 추예린, 전다현",
        titleIntro: "국내 최고 트렌드 전망서",
        intro: "청룡의 해, 2024년을 분석하다",
        bookPicUrl: "book1.png",
        state: "up"),
    testBook(
        id: 2,
        rankingId: 2,
        title: "퓨처셀프",
        writer: "벤저민 하디",
        bookPicUrl: "book2.png"),
    testBook(
        id: 3,
        rankingId: 3,
        title: "시대예보:핵개인의 시대",
        writer: "송길영",
        bookPicUrl: "book3.png"),
    testBook(
        id: 4,
        rankingId: 4,
        title: "설자은, 금성으로 돌아오다",
        writer: "정세랑",
        bookPicUrl: "book4.png",
        state: "down"),
    testBook(
        id: 5,
        rankingId: 5,
        title: "책으로 가는 문",
        writer: "미야자키 하야오",
        bookPicUrl: "book5.png",
        titleIntro: "상상력의 거장, 미야자키 하야오의 독서 에세이",
        intro: "그의 판타지 세계를 이끌어낸 50권의 책"),
    testBook(
        id: 6,
        rankingId: 6,
        title: "로마 이야기",
        writer: "줌파 라히리",
        bookPicUrl: "book6.png",
        state: "up"),
    testBook(
        id: 7,
        rankingId: 7,
        title: "문과 남자의 과학 공부",
        writer: "유시민",
        bookPicUrl: "book7.png",
        titleIntro: "나는 무엇이고 왜 존재하며 어디로 가는가"),
    testBook(
        id: 8,
        rankingId: 8,
        title: "아주 희미한 빛으로",
        writer: "최은영",
        bookPicUrl: "book8.png",
        state: "down"),
    testBook(
        id: 9,
        rankingId: 9,
        title: "역행자",
        writer: "자청",
        bookPicUrl: "book9.png",
        state: "up"),
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
                    NowImageSliderForm(
                        imageController: _imageController,
                        imageList: imageList,
                        current: _bannerCurrent,
                        funPageChanged: (index, reason) {
                          setState(() {
                            _bannerCurrent = index;
                          });
                        }),
                    NowTextSliderForm(
                        textController: _textController,
                        textList: textList,
                        current: _bannerCurrent,
                        funPageChanged: (index, reason) {
                          setState(() {
                            _bannerCurrent = index;
                          });
                        }),
                    // sliderIndicator(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: gapXxlarge)),

          /// 지금 서점 베스트
          SliverToBoxAdapter(
              child: Column(
            children: [
              NowTitleAndForwardForm(),
              NowBookSlider(
                  controller: _carouselController,
                  rankingBooks: rankingBooks,
                  funPageChanged: (index, reason) {
                    setState(() {
                      _bestCurrent = index;
                    });
                  }),
              SizedBox(height: gapLarge),
              NowSliderIndicator(
                  controller: _carouselController,
                  current: _bestCurrent,
                  rankingBooks: rankingBooks),
            ],
          )),

          /// 한달 이내에 출간된 책
          SliverToBoxAdapter(child: SizedBox(height: gapXxlarge)),
          SliverToBoxAdapter(
            child: CustomTitleAndForwardForm(
              title: "한 달 이내에 출간된 책",
              funPageRoute: () {
                Navigator.pushNamed(context, Move.OneMonthPressBookListPage);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: gapMain),
              child: Container(
                height: getScreenWidth(context) * 0.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemExtent: 150,
                  itemBuilder: (context, index) {
                    return NowBookCard(book: books[index]);
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: gapMain),
              child: Container(
                height: getScreenWidth(context) * 0.55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemExtent: 120,
                  itemBuilder: (context, index) {
                    index += 8;
                    return NowSmallBookCard(book: books[index]);
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: gapLarge)),

          /// 오늘의 한 문장
          SliverToBoxAdapter(
            child: CustomTitleAndForwardForm(
                title: "오늘의 한 문장", funPageRoute: () {}),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: getScreenWidth(context) * 1.1,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lemon.jpg"),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6),
                    BlendMode.srcATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("삶이란,", style: subTitle1()),
                  SizedBox(height: gapXlarge),
                  Container(
                    height: getScreenWidth(context) * 0.65,
                    width: getScreenWidth(context) * 0.55,
                    decoration: BoxDecoration(
                      color: kBackWhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: kFontLightGray, // 그림자의 색상
                          offset: Offset(1, 1), // 그림자의 위치 (x, y)
                          blurRadius: 8.0, // 그림자의 흐림 정도
                          spreadRadius: 2.0, // 그림자의 확산 정도
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(gapLarge),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/sign2.png"),
                            color: kFontGray,
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: gapLarge),
                  Text("노재희, <나무와 함께 정처 없음>")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
