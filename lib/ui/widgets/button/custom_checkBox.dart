import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

/// Flutter code sample for [Checkbox].

void main() => runApp(const CheckboxExampleApp());

class CheckboxExampleApp extends StatelessWidget {
  const CheckboxExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox Sample')),
        body: const Center(
          child: CheckboxExample(),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.contains(MaterialState.disabled)) {
        return kBackWhite; // 체크되지 않은 상태 배경색
      }
      if (states.contains(MaterialState.selected)) {
        return kPrimaryColor; // 체크된 상태 배경색
      }
      if (states.any(interactiveStates.contains)) {
        return kBackWhite;
      }
      return kBackWhite;
    }

    return Checkbox(
      checkColor: kBackBlack,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
