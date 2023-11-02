import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_payment_page/widgets/form/my_setting_payment_title_form.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_payment_page/widgets/my_setting_sub_radio_button.dart';

class MySettingPaymentBody extends StatefulWidget {
  const MySettingPaymentBody({super.key});

  @override
  State<MySettingPaymentBody> createState() => _MySettingPaymentBodyState();
}

class _MySettingPaymentBodyState extends State<MySettingPaymentBody> {
  int? selectedNum;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MySettingPaymentTitleForm(),
        Positioned(
          bottom: 0,
          child: Container(
            height: getScreenHeight(context) * 0.7,
            width: getScreenWidth(context),
            decoration: BoxDecoration(
              color: kBackWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              child: ListView(
                children: [
                  Text("전자책 정기 구독", style: subTitle1()),
                  Text("15만 권의 전자책, 오디오북 등 모든 콘텐츠를 무제한으로",
                      style: body1(
                          mColor: kFontGray, mFontWeight: FontWeight.normal)),
                  SizedBox(height: gapMain),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MySettingSubRadioButton(
                        selectedBoxNum: 0,
                        unSelectedBoxNum: 1,
                        tagText: "#스테디셀러",
                        selectedValue: selectedNum,
                        onChanged: (value) {
                          setState(() {
                            selectedNum = value;
                          });
                        },
                      ),
                      MySettingSubRadioButton(
                        selectedBoxNum: 1,
                        unSelectedBoxNum: 0,
                        tagText: "#초절약 상품",
                        tagBorderColor: kFontRed,
                        tagFontColor: kFontRed,
                        tagBoxColor: kBackRed,
                        selectedValue: selectedNum,
                        onChanged: (value) {
                          setState(() {
                            selectedNum = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
