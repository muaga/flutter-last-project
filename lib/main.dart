import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // 외부화면 클릭 시 키보드 닫기 이벤트
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: Move.MyLibraryMainPage,
        // initialRoute: Move.MainSplashPage,
        routes: getRouters(),
      ),
    );
  }
}
