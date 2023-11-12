import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_image_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_now/now_main_page/widgets/banner_slider/now_text_slider_form.dart';
import 'package:flutter_blog/ui/pages/today_story/story_book_list_page/story_book_list_page.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/recommend/story_recommend_form.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/story_book_card.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';
import 'package:flutter_blog/ui/widgets/form/custom_footer_form.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoryMainBody extends ConsumerStatefulWidget {
  const StoryMainBody({super.key});

  @override
  _StoryMainBodyState createState() => _StoryMainBodyState();
}

class _StoryMainBodyState extends ConsumerState<StoryMainBody> {
  // 슬라이더 초기 번호
  int _bannerCurrent = 0;
  int _eventCurrent = 0;

  // AppBar 초기 아이템 컬러
  Color currentColor = kFontWhite;

  late List<StoryBookDTO> loveStoryBookList = [];
  late List<StoryBookDTO> fanStoryBookList = [];
  late List<StoryBookDTO> normalStoryBookList = [];

  // 컨트롤러
  final CarouselController _imageController = CarouselController();
  final CarouselController _textController = CarouselController();
  final ScrollController _scrollController = ScrollController();

  List<String> imageList = [
    "ad_story_1.jpg",
    "ad_story_2.jpg",
    "ad_story_3.jpg"
  ];

  List<String> textList = [
    "입대전 마지막으로 떠난 여행\n난 각성자가 되었다",
    "조직에 배신당한 히트맨\n암살 당해 죽고 회귀했다",
    "뚱보 김병장이 재능 만랩\n엔터테이너로 거듭난다"
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    changeBookList(1);
    changeBookList(2);
    changeBookList(3);
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

  void changeBookList(int categoryId) async {
    TodayStoryModel? model = await ref
        .read(todayStoryProvider(categoryId).notifier)
        .notifyInit(categoryId);
    if (categoryId == 1) {
      setState(() {
        loveStoryBookList = model.storyBookList!;
      });
    }
    if (categoryId == 2) {
      setState(() {
        fanStoryBookList = model.storyBookList!;
      });
    }
    if (categoryId == 3) {
      setState(() {
        normalStoryBookList = model.storyBookList!;
      });
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
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, Move.MillieIndexStackNavigationBar);
                  },
                  child: Text("NOW",
                      style: subTitle2(
                          mFontWeight: FontWeight.bold, mColor: currentColor))),
              TextButton(
                  onPressed: () {},
                  child: Text("스토리",
                      style: title1(
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
          SliverToBoxAdapter(child: SizedBox(height: gapLarge)),

          /// 카테고리별 추천 책
          SliverToBoxAdapter(
            child: StoryRecommendForm(
                fanBookList: fanStoryBookList,
                loveBookList: loveStoryBookList,
                normalBookList: normalStoryBookList),
          ),

          SliverToBoxAdapter(child: SizedBox(height: gapXxlarge)),

          /// # 무협 # 판타지
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTitleAndForwardForm(
                  title: "# 무협 # 판타지",
                  funPageRoute: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryBookListPage(
                          title: "# 무협 # 판타지",
                          books: fanStoryBookList,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(gapMain),
                  child: Container(
                    height: getScreenWidth(context) * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        return StoryBookCard(book: fanStoryBookList[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: gapLarge)),

          /// # 이 무렵, 내가 사랑하는 이야기
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTitleAndForwardForm(
                  title: "# 이 무렵, 내가 사랑하는 이야기",
                  funPageRoute: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryBookListPage(
                          title: "# 이 무렵, 내가 사랑하는 이야기",
                          books: loveStoryBookList,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(gapMain),
                  child: Container(
                    height: getScreenWidth(context) * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        return StoryBookCard(book: loveStoryBookList[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: gapLarge)),

          /// # 끌리는 책이 없다면 이 책 어때요?
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTitleAndForwardForm(
                  title: "# 끌리는 책이 없다면 이 책 어때요?",
                  funPageRoute: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryBookListPage(
                          title: "# 끌리는 책이 없다면 이 책 어때요?",
                          books: normalStoryBookList,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(gapMain),
                  child: Container(
                    height: getScreenWidth(context) * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        return StoryBookCard(book: normalStoryBookList[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// footer
          SliverToBoxAdapter(
            child: CustomFooterForm(),
          ),
        ],
      ),
    );
  }
}
