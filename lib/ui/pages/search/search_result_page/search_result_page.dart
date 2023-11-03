import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/search/search_result_page/widgets/body/search_result_body.dart';

class SearchResultPage extends StatefulWidget {
  final String searchText;
  const SearchResultPage({super.key, required this.searchText});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late String _searchText;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _searchText = widget.searchText;
    return Scaffold(
      // 페이지 화면
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: kFontBlack),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("검색결과"),
        centerTitle: true, // appbar의 title을 가운데로
      ),
      // bottomNavigationBar: MillieIndexStackNavigationBar(),
      body: SearchResultBody(
          tabController: _tabController, searchText: _searchText),
    );
  }
}
