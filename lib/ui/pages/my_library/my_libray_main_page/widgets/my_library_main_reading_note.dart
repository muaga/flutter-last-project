import 'package:flutter/material.dart';

class MyLibraryMainReadingNote extends StatefulWidget {
  const MyLibraryMainReadingNote({super.key});

  @override
  State<MyLibraryMainReadingNote> createState() => _MyLibraryMainReadingNoteState();
}

class _MyLibraryMainReadingNoteState extends State<MyLibraryMainReadingNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "독서노트"
        ),
      ),
      body:               GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
              child: Image.network(
                  "https://picsum.photos/200/200")
                  );

        },
      ),
    );
  }
}
