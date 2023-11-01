import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_profile_page/widgets/my_setting_profile_member_type_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_check_box_and_title_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form_and_validator_button.dart';

class MySettingProfileBody extends StatelessWidget {
  MySettingProfileBody({super.key});

  final _nickName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Form(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MySettingProfileMemberTypeForm(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: gapXlarge),
            ),
            SliverToBoxAdapter(
              child: CustomTextFormAndValidatorButton(
                  title: "필명",
                  hintText: "호기심 많은 률류류",
                  buttonText: "중복확인",
                  funValidator: validateNickname(),
                  controller: _nickName,
                  guideText: "욕설, 비속어 사용 시 서비스 이용이 제한될 수 있습니다."),
            ),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomThinLine(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomTextForm(
                title: "비밀번호",
                obscureText: true,
                hintText: "●●●●●●●●●",
                funValidator: validatePassword(),
                controller: _password,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextForm(
                title: "이메일",
                hintText: "이메일 주소 입력",
                funValidator: validateEmail(),
                controller: _email,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomThinLine(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomCheckBoxAndTitleForm(
                title: "개인정보 수집 및 이용 동의",
                color: Colors.transparent,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("· 개인정보 수집 목적 : 원활한 밀리의 서재 서비스 이용을 위해 수집합니다.",
                      style: body4()),
                  SizedBox(height: gapSmall),
                  Text("· 개인정보 수집 항목 : [필수] 프로필 이미지, 필명, 휴대폰 번호, 이메일",
                      style: body4()),
                  SizedBox(height: gapSmall),
                  Text("· 개인정보 이용 기간 : 회원 탈퇴 시 또는 개인정보처리방침에 따라 보유 및 파기 됩니다.",
                      style: body4()),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomBottomButton(
                buttonText: "확인",
                funPageRoute: () {
                  // TODO 은혜 : 다시 main으로 가기
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
