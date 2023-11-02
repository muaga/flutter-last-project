import 'package:flutter/material.dart';

class CustomPopupButton extends StatelessWidget {
  final String popupText;
  const CustomPopupButton({required this.popupText});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String choice) {
        if (choice == popupText) {
          // 작업을 수행하거나 다이얼로그를 표시할 수 있습니다.
          // 예를 들어 showDialog()를 사용하여 삭제 확인 대화상자를 표시할 수 있습니다.
        }
      },
      itemBuilder: (BuildContext context) {
        return [popupText].map((String choice) {
          return PopupMenuItem<String>(
            padding: EdgeInsets.only(left: 25),
            height: 20,
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
