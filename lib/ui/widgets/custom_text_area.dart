import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final controller;
  final onChanged;

  const CustomTextArea({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.funValidator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        maxLines: 20,
        validator: funValidator,
        decoration:
            InputDecoration(hintText: "$hint", border: InputBorder.none),
        onChanged: onChanged,
      ),
    );
  }
}
