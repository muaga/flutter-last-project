import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class BookDetailExpandableDescription extends StatefulWidget {
  final String title;
  final String description;

  BookDetailExpandableDescription(
      {required this.title, required this.description});

  @override
  State<BookDetailExpandableDescription> createState() =>
      _BookDetailExpandableDescriptionState();
}

class _BookDetailExpandableDescriptionState
    extends State<BookDetailExpandableDescription> {
  bool isExpanded = false;

  void toggleDescription() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: subTitle1(),
      ),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more, // 확장 및 축소 아이콘 변경
        color: Colors.black, // 아이콘 색상
      ),
      onExpansionChanged: (bool expanding) {
        toggleDescription();
      },
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(gapMain),
          child: Text(
            widget.description,
            style: body1(),
            textAlign: TextAlign.left,
          ),
        ),
      ],
      initiallyExpanded: isExpanded,
    );
  }
}
