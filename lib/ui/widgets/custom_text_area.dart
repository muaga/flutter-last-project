import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final controller;
  final String initValue;
  final onChanged;

  const CustomTextArea({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.funValidator,
    required this.controller,
    this.initValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = initValue;

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
