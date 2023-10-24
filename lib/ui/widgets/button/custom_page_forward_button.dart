import 'package:flutter/material.dart';

class CustomPageForwardButton extends StatelessWidget {
  final Widget pageLoad;
  const CustomPageForwardButton({required this.pageLoad});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pageLoad));
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
      ),
    );
  }
}
