import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/appBar/my_library_main_app_bar.dart';
import 'package:flutter_blog/ui/pages/my_library/my_libray_main_page/widgets/my_library_main_tab_bar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLibraryMainBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 로그인 유무
    final SessionUser sessionUser = ref.read(sessionStore);

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          MyLibraryMainAppBar(user: sessionUser.user!),
        ];
      },
      body: MyLibraryMainTabBarView(user: sessionUser.user!),
    );
  }
}
