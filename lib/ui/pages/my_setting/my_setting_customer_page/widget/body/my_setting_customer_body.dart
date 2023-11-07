import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/model/book_reply.dart';
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
                              icon: iconBookMark(),
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
                            itemCount: bookReplys.length,
                            itemBuilder: (BuildContext context, int index) {
                              final book = books[index];

                              return Column(
                                children: [
                                  MySettingExpandableDescription(
                                      title: "결제/환불",
                                      description: "결제/환불 문의사항"),
                                  SizedBox(height: gapLarge),
                                ],
                              );
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
                                      title: "회원/비회원",
                                      description: "회원/비회원 문의사항"),
                                  SizedBox(height: gapLarge),
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
          itemCount: bookReplys.length,
          itemBuilder: (BuildContext context, int index) {
            final book = books[index];

            return Padding(
              padding: const EdgeInsets.all(gapMain),
              child: MySettingCustomerNotice(
                  noticeTitle: "공지사항입니다",
                  noticeDate: "2023-11.04",
                  noticeComent: "주목주목 책을 많이 읽기 이벤트 당첨자 발표"),
            );
          },
        ),
      ],
    );
  }
}