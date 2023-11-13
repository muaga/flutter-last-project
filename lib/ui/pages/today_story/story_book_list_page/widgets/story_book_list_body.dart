import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/today_story/story_book_list_page/widgets/story_book_grid_view.dart';
import 'package:flutter_blog/ui/pages/today_story/story_main_page/widgets/view_model/today_story_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thin_line.dart';

class StoryBookListBody extends StatelessWidget {
  const StoryBookListBody({super.key, required this.books});

  final List<StoryBookDTO> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: gapXlarge, vertical: gapMain),
            child: Text("총 ${books.length}권", style: subTitle2())),
        CustomThinLine(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: gapMain),
            child: StoryBookGridView(
              books: books,
            ),
          ),
        ),
      ],
    );
  }
}
