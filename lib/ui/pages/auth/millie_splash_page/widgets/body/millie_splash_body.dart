import 'package:flutter/material.dart';

class MainSplashBody extends StatelessWidget {
  const MainSplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/logos/millie_logo_pupple.png", width: 140),
    );
  }
}
