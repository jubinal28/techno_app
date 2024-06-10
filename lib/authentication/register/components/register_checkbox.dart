import 'package:flutter/material.dart';

class CheckBoxField extends StatefulWidget {
  CheckBoxField({super.key});

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text(
          'By creating an account, you agree to our Term and Conditions',
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
