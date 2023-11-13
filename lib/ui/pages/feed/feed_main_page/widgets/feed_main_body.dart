import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/bottom_sheet/custom_write_bottom_sheet.dart';
import 'package:flutter_blog/ui/widgets/form/custom_post_list_form.dart';

class FeedMainBody extends StatelessWidget {
  const FeedMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leading: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.only(left: gapMain),
                child: Text("피드", style: subTitle1())),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: gapMain),
                child: CustomWriteBottomSheet()),
          ],
        ),
        SliverFillRemaining(child: CustomPostListForm())
      ],
    );
  }
}
