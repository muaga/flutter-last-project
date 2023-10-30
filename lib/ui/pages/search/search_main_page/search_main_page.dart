import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/search/search_main_page/widgets/body/search_main_body.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({super.key});

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
      body: SearchMainBody(),
    );
  }
}
