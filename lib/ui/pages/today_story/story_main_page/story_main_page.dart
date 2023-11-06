import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/body/story_main_body.dart';

class StoryMainPage extends StatelessWidget {
  const StoryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryMainBody(),
    );
  }
}
