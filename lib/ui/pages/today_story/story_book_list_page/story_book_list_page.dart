import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/today_story/story_book_list_page/widgets/story_book_list_body.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';

class StoryBookListPage extends StatelessWidget {
  const StoryBookListPage(
      {super.key, required this.books, required this.title});

  final List<StoryBookDTO> books;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text("${title}"),
        elevation: 0.5,
      ),
      body: StoryBookListBody(books: books),
    );
  }
}
