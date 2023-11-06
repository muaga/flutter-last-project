import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/widgets/form/custom_title_and_forword_form.dart';

class NowMonthTitleAndForwardForm extends StatelessWidget {
  const NowMonthTitleAndForwardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomTitleAndForwardForm(
        title: "한 달 이내에 출간된 책",
        funPageRoute: () {
          Navigator.pushNamed(context, Move.OneMonthPressBookListPage);
        },
      ),
    );
  }
}
