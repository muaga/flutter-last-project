import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';

class NowDailyTitleAndForwardForm extends StatelessWidget {
  const NowDailyTitleAndForwardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomTitleAndForwardForm(title: "오늘의 한 문장", funPageRoute: () {}),
    );
  }
}
