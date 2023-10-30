import 'package:flutter/material.dart';

class MyLibraryMainBookcase extends StatefulWidget {
  const MyLibraryMainBookcase({super.key});

  @override
  State<MyLibraryMainBookcase> createState() => _MyLibraryMainBookcaseState();
}

class _MyLibraryMainBookcaseState extends State<MyLibraryMainBookcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("책장"),
      ),
      body:               GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Image.network(
              "https://picsum.photos/id/${index + 11}/200/200");
        },
      ),
    );
  }
}