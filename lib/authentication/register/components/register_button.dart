import 'package:flutter/material.dart';
import 'package:techno_app/authentication/login/login_main.dart';
import 'package:techno_app/constants/colors.dart';

class RegisterButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  RegisterButton({super.key, required this.formKey});

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 50,
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: CustomColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (widget.formKey.currentState!.validate() && isChecked) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginMain(
                      title: 'Login',
                    ),
                  ),
                );
              } else if (!isChecked) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You must accept the terms and conditions'),
                  ),
                );
              }
            },
            child: const Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ],
    );
  }
}
