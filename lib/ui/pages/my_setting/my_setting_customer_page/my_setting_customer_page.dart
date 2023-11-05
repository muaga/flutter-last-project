import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_category_button.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_customer_notice.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_expandable_description.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class MySettingCustomerPage extends StatefulWidget {
  const MySettingCustomerPage({Key? key}) : super(key: key);

  @override
  _MySettingCustomerPageState createState() => _MySettingCustomerPageState();
}

class _MySettingCustomerPageState extends State<MySettingCustomerPage> {
  int _pageIndex = 0;


  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(),
        ),
        title: Text("고객센터", style: title1()),
      ),
      body: Padding(
        padding: EdgeInsets.all(gapMain),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      child: Row(
                        children: [
                          MySettingCategoryButton(
                              label: "FAQ",
                              index: 0,
                              pageIndex: _pageIndex,
                              fontWeight: FontWeight.bold,
                              onPress: () {
                                changePage(0);
                              }),
                          SizedBox(width: 40),
                          MySettingCategoryButton(
                              label: "공지사항",
                              index: 1,
                              pageIndex: _pageIndex,
                              fontWeight: FontWeight.bold,
                              onPress: () {
                                changePage(1);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    child: IndexedStack(
                      index: _pageIndex,
                      children: [
                        /// FAQ
                        ListView.builder(
                          itemCount: bookReplys.length,
                          itemBuilder: (BuildContext context, int index) {
                            final bookReply = bookReplys[index];

                            return Column(
                              children: [
                                MySettingExpandableDescription(title: "title", description: "description"),
                                SizedBox(height: gapLarge),
                              ],
                            );
                          },
                        ),

                        /// 공지사항
                        ListView.builder(
                          itemCount: bookReplys.length,
                          itemBuilder: (BuildContext context, int index) {
                            final book = books[index];

                            return MySettingCustomerNotice(noticeTitle: "공지사항입니다", noticeDate: "2023-11.04", noticeComent: "주목주목 책을 많이 읽기 이벤트 당첨자 발표");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

