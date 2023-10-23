import 'package:flutter/material.dart';

class CustomPageForwardButton extends StatelessWidget {
  const CustomPageForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
