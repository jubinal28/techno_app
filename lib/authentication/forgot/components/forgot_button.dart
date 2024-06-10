import 'package:flutter/material.dart';
import 'package:techno_app/authentication/login/login_main.dart';
import 'package:techno_app/constants/colors.dart';

class ForgotButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ForgotButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          if (formKey.currentState!.validate()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginMain(
                  title: 'Login',
                ),
              ),
            );
          }
        },
        child: const Text(
          "Forgot",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
