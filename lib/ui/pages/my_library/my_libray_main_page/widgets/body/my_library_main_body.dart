import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_tab_bar_view.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainBody extends ConsumerWidget {
  final int userId;
  const MyLibraryMainBody({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // User user = User(
    //     id: 1,
    //     username: "ssar",
    //     email: "ssar@nate.com",
    //     nickname: "유재석",
    //     picUrl: "user1.png",
    //     createdAt: "2023-10-10");
    // 로그인 유무
    final SessionUser sessionUser = ref.read(sessionStore);

    // 책 정보 검색
    final MyLibraryMainModel = ref.watch(MyLibraryProvider(userId));

    MyLibraryModel? model = ref.watch(myLibraryProvider);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          MyLibraryMainAppBar(user: user),
        ];
      },
      body: MyLibraryMainTabBarView(user: user),
    );
  }
}
