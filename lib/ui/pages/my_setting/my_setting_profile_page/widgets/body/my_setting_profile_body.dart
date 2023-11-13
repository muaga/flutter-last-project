import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request_dto.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_setting/my_setting_profile_page/widgets/my_setting_profile_member_type_form.dart';
import 'package:flutter_blog/ui/widgets/button/custom_bottom_button.dart';
import 'package:flutter_blog/ui/widgets/form/custom_check_box_and_title_form.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';
import 'package:flutter_blog/ui/widgets/text_form/custom_text_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySettingProfileBody extends ConsumerWidget {
  MySettingProfileBody({super.key});

  final _formkey = GlobalKey<FormState>();
  final _nickName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionStore);

    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Form(
        key: _formkey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MySettingProfileMemberTypeForm()),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomTextForm(
                title: "필명",
                hintText: "${sessionUser.user!.nickname}",
                funValidator: validateNickname(),
                controller: _nickName,
              ),
            ),
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
            SliverToBoxAdapter(child: CustomThinLine()),
            SliverToBoxAdapter(child: SizedBox(height: gapLarge)),
            SliverToBoxAdapter(
              child: CustomTextForm(
                title: "이메일",
                hintText: "${sessionUser.user!.email}",
                funValidator: validateEmail(),
                controller: _email,
              ),
            ),
            SliverToBoxAdapter(child: CustomThinLine()),
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
              funPageRoute: () {
                if (_formkey.currentState!.validate()) {
                  UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(
                      nickName: _nickName.text,
                      password: _password.text,
                      email: _email.text);
                  // ref.read(sessionStore).userUpdate(userUpdateReqDTO);
                }
              },
              buttonText: "확인",
            ))
          ],
        ),
      ),
    );
  }
}
