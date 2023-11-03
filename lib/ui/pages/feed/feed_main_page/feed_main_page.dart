import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/feed/feed_main_page/widgets/feed_main_body.dart';

class FeedMainPage extends StatelessWidget {
  const FeedMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Image(
            image: AssetImage("assets/logos/millie_logo_black.png"),
          ),
        ),
        leadingWidth: 70,
      ),
      body: FeedMainBody(),
    );
  }
}
