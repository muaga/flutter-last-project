import 'package:flutter/material.dart';

class SearchResultTabBar extends StatelessWidget {
  const SearchResultTabBar({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      pinned: true,
      leadingWidth: 0,
      leading: Container(), // 뒤로가기 버튼 비활성화
      title: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(child: Text("통합", style: TextStyle(color: Colors.black))),
            Tab(child: Text("독서", style: TextStyle(color: Colors.black))),
            Tab(child: Text("포스트", style: TextStyle(color: Colors.black))),
          ],
          indicatorColor: Colors.black,
        ),
      ),
    );
  }
}
