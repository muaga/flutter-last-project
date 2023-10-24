import 'package:flutter/material.dart';

class CustomBottomNextButton extends StatelessWidget {
  final String buttontext;
  final funPageRoute;
  const CustomBottomNextButton(
      {required this.buttontext, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: funPageRoute,
        child: Text("${buttontext}"),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)));
  }
}
