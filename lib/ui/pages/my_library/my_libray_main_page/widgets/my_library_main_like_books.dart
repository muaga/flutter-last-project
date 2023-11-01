import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class MyLibraryMainLikeBooks extends StatefulWidget {
  const MyLibraryMainLikeBooks({super.key});

  @override
  State<MyLibraryMainLikeBooks> createState() => _MyLibraryMainLikeBooksState();
}

class _MyLibraryMainLikeBooksState extends State<MyLibraryMainLikeBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("포스트"),
      ),
      body: Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 2,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                int? bookId = books[index].id;
                /// TODO 대욱 : 포스트 쓰는 주소로 연결
                Navigator.pushNamed(context, "/searchMain");
              },
              child: CustomGridBookCard(books[index]),
            );
          },
          // 더 많은 리스트 아이템을 추가할 수 있습니다.
        ),
      ),
    );
  }
}
