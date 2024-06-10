import 'package:flutter/material.dart';
import 'package:techno_app/authentication/register/components/register_cpassword.dart';
import 'package:techno_app/authentication/register/components/register_fname.dart';
import 'package:techno_app/authentication/register/components/register_lname.dart';

import '../../../features/dashboard/home/home_main.dart';
import 'register_button.dart';
import 'register_email_field.dart';
import 'register_pass_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key, required String title});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  bool isChecked = false;

  RegExp get passwordRegExp =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  RegExp get _emailRegex => RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  bool isVisible = false;

  bool isLoginTrue = false;

  bool isPasswordCorrect = true;

  login() async {
    if (!mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeMain(
                  title: '',
                )));
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(Assets.lnlogo),
                  const SizedBox(height: 15),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  FnameField(fnameController: fname),
                  LnameField(lnameController: lname),
                  EmailField(emailController: email),
                  PasswordField(passwordController: password),
                  CPasswordField(
                    cpasswordController: cpassword,
                    passwordController: password,
                  ),
                  const SizedBox(height: 10),

                  RegisterButton(formKey: formKey),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
