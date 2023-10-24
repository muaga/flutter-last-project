import 'package:flutter/material.dart';

class CustomBottomNextButton extends StatelessWidget {
  const CustomBottomNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text("다음"),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)));
  }
}
