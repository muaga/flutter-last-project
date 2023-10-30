import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/search_result_page.dart';

class CustomTextFormFieldSearchBar extends StatelessWidget {
  CustomTextFormFieldSearchBar({super.key, this.searchText});
  final String? searchText;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      pinned: true,
      leading: Icon(
        Icons.search_rounded,
        color: Colors.black,
      ),
      title: TextFormField(
        decoration: InputDecoration(
          hintText: searchText ?? "검색어를 입력하세요",
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        onFieldSubmitted: (String value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchResultPage(searchText: value)));
          // Logger().d("searchText : ${value}");
        },
      ),
    );
  }
}
