import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/search_main_category_list.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/search_main_ad.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/search_main_category_title.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/search_main_suggest_keyword.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/search_main_suggest_keyword_title.dart';
import 'package:flutter_blog/ui/widgets/bar/custom_text_form_field_search_bar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_thick_line.dart';

class SearchMainBody extends StatefulWidget {
  const SearchMainBody({super.key});

  @override
  State<SearchMainBody> createState() => _SearchMainBodyState();
}

class _SearchMainBodyState extends State<SearchMainBody> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomTextFormFieldSearchBar(),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SearchMainSuggestKeywordTitle(),
          SearchMainSuggestKeyword(),
          // SliverToBoxAdapter(child: SizedBox(height: 20)),
          SearchMainAd(),
          SliverToBoxAdapter(child: CustomThickLine()),
          SearchMainCategoryTitle(),
        ];
      },
      body: SearchMainCategoryList(),
    );
  }
}
