import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_customer_page/widget/body/my_setting_customer_body.dart';

class MySettingCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 개수 설정 (현재는 FAQ 탭 하나)
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack(),
          ),
          title: Text("고객센터", style: title1()),
          bottom: TabBar(
            indicatorColor: kPointColor,
            tabs: [
              Tab(
                child: Text("FAQ", style: subTitle1()),
              ),
              Tab(
                child: Text("공지사항", style: subTitle1()),
              ),
            ],
          ),
        ),
        body: MySettingCustomerBody(),
      ),
    );
  }
}
