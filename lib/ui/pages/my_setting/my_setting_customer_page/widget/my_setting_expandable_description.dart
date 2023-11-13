import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class MySettingExpandableDescription extends StatefulWidget {
  final String title;
  final String description;

  MySettingExpandableDescription(
      {required this.title, required this.description});

  @override
  State<MySettingExpandableDescription> createState() =>
      _MySettingExpandableDescriptionState();
}

class _MySettingExpandableDescriptionState
    extends State<MySettingExpandableDescription> {
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
        style: subTitle2(mFontWeight: FontWeight.normal),
      ),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more, // 확장 및 축소 아이콘 변경
        size: 30,
        color: Colors.black, // 아이콘 색상
      ),
      onExpansionChanged: (bool expanding) {
        toggleDescription();
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: gapMain),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(gapMain),
            child: Text(
              widget.description,
              style: body1(mFontWeight: FontWeight.w300),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
      initiallyExpanded: isExpanded,
    );
  }
}
