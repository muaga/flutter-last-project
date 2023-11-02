import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/ui/widgets/custom_grid_book_card.dart';

class MyLibraryOneReview extends StatefulWidget {
  const MyLibraryOneReview({super.key});

  @override
  State<MyLibraryOneReview> createState() => _MyLibraryOneReview();
}

class _MyLibraryOneReview extends State<MyLibraryOneReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("한 줄 리뷰쓰기"),
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

                /// TODO 대욱 : 책 한줄리뷰 리스트 페이지로 가야합니다
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
