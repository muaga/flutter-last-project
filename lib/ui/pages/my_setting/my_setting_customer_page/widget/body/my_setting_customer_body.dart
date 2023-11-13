import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
import 'package:flutter_blog/data/model/faq.dart';
import 'package:flutter_blog/data/model/notice.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_category_button.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_customer_notice.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/my_setting_expandable_description.dart';

class MySettingCustomerBody extends StatefulWidget {
  const MySettingCustomerBody({
    Key? key,
  });

  @override
  State<MySettingCustomerBody> createState() => _MySettingCustomerBodyState();
}

class _MySettingCustomerBodyState extends State<MySettingCustomerBody> {
  int _pageIndex = 0;

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        /// FAQ 탭
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MySettingCategoryButton(
                              label: "결제/환불",
                              index: 0,
                              pageIndex: _pageIndex,
                              fontWeight: FontWeight.bold,
                              onPress: () {
                                changePage(0);
                              },
                              icon: iconRefund(),
                            ),
                            MySettingCategoryButton(
                              label: "회원/비회원",
                              index: 1,
                              pageIndex: _pageIndex,
                              fontWeight: FontWeight.bold,
                              onPress: () {
                                changePage(1);
                              },
                              icon: iconBottomSetting(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: IndexedStack(
                        index: _pageIndex,
                        children: [
                          /// 결제/환불
                          ListView.builder(
                            itemCount: paymentFAQ.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MySettingExpandableDescription(
                                  title: "${paymentFAQ[index].subTitle}",
                                  description: "${paymentFAQ[index].content}");
                            },
                          ),

                          /// 회원/비회원
                          ListView.builder(
                            itemCount: bookReplys.length,
                            itemBuilder: (BuildContext context, int index) {
                              final book = books[index];

                              return Column(
                                children: [
                                  MySettingExpandableDescription(
                                      title: "${userFAQ[index].subTitle}",
                                      description: "${userFAQ[index].content}"),
                                ],
                              );
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

        /// 공지사항 탭
        ListView.builder(
          itemCount: noticeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: gapMain),
              child: MySettingCustomerNotice(
                  noticeTitle: "${noticeList[index].subTitle}",
                  noticeDate: "${noticeList[index].createdAt}",
                  noticeComent: "${noticeList[index].content}"),
            );
          },
        ),
      ],
    );
  }
}
