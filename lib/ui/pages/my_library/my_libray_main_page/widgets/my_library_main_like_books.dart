import 'package:flutter/material.dart';

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
        title: Text("좋아하는 책"),
      ),
      body:               GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    height: 210,
                    width: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("이 사진을 삭제하시겠습니까?"),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // 삭제 로직을 여기에 구현
                                Navigator.of(context).pop();
                              },
                              child: Text("삭제"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("취소"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Image.network(
                "https://picsum.photos/id/${index + 1}/200/200"),
          );
        },
      ),
    );
  }
}
