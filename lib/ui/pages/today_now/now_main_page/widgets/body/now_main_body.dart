import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_image_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_text_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_book_slider.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_slider_indicator.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/best_slider/now_title_and_forward_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/daily/now_daily_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/daily/now_daily_title_and_forward_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/event/now_event_slider.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/event/now_title_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/month/now_month_book_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/month/now_month_book_small_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/month/now_month_title_and_forward_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/reponse_dto/best_book_response_dto_test.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/reponse_dto/event_response_dto_test.dart';
import 'package:flutter_blog/ui/widgets/form/custom_footer_form.dart';

class NowMainBody extends StatefulWidget {
  const NowMainBody({super.key});

  @override
  State<NowMainBody> createState() => _NowMainBodyState();
}

class _NowMainBodyState extends State<NowMainBody> {
  // 슬라이더 초기 번호
  int _bannerCurrent = 0;
  int _bestCurrent = 0;
  int _eventCurrent = 0;

  // AppBar 초기 아이템 컬러
  Color currentColor = kFontWhite;

  // 컨트롤러
  final CarouselController _imageController = CarouselController();
  final CarouselController _textController = CarouselController();
  final ScrollController _scrollController = ScrollController();
  final CarouselController _carouselController = CarouselController();
  final CarouselController _eventController = CarouselController();

  List<String> imageList = [
    "ad_moon.jpg",
    "ad_november.jpg",
    "ad_higasino_geigo.jpg",
  ];

  List<String> textList = [
    "내 딸이 달에게 납치되었다?\n상상력을 자극하는 '달의 아이' 공개",
    "11월에는 어떤 책을 읽지?\n추천 맛집! 에디터의 선택",
    "히가시노 게이고 뭐부터 읽지?\n나의 소설 취향 소설보기",
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
          /// 배너

          SliverAppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Image(
                  image: AssetImage("assets/logos/millie_logo_black.png"),
                  color: currentColor),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text("NOW",
                      style: title1(
                          mFontWeight: FontWeight.bold, mColor: currentColor))),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, Move.StoryMainPage);
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

          SliverToBoxAdapter(child: SizedBox(height: gapXxlarge)),

          /// 놓치기 아쉬운 소식!
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NowTitleForm(),
                NowEventSlider(
                  controller: _eventController,
                  events: events,
                  funPageChanged: (index, reason) {
                    setState(() {
                      _eventCurrent = index;
                    });
                  },
                )
              ],
            ),
          ),

          /// 한달 이내에 출간된 책
          SliverToBoxAdapter(child: SizedBox(height: gapXxlarge)),
          NowMonthTitleAndForwardForm(),
          NowMonthBookForm(books: books),
          NowMonthBookSmallForm(books: books),
          SliverToBoxAdapter(child: SizedBox(height: gapLarge)),

          /// 오늘의 한 문장
          NowDailyTitleAndForwardForm(),
          NowDailyForm(),

          /// footer
          SliverToBoxAdapter(
            child: CustomFooterForm(),
          ),
        ],
      ),
    );
  }
}
