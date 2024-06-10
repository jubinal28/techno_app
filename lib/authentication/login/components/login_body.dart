import 'package:flutter/material.dart';
import 'package:techno_app/authentication/login/components/login_email_field.dart';
import 'package:techno_app/authentication/login/components/login_pass_field.dart';
import 'package:techno_app/authentication/register/register_main.dart';
import 'package:techno_app/constants/assets.dart';

import '../../../features/dashboard/home/home_main.dart';
import '../../forgot/forgot_main.dart';
import 'login_button.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key, required String title});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

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
                  ClipRRect(
                    child: Image.asset(
                      Assets.logoFood,
                      height: 170,
                      width: 170,
                    ),
                  ),
                  const SizedBox(height: 20),
                  EmailField(emailController: email),
                  PasswordField(passwordController: password),
                  const SizedBox(height: 10),
                  LoginButton(formKey: formKey),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotMain(
                                    title: '',
                                  ),
                                ));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Login with",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: Colors.grey.shade400, width: 0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Image.asset(
                              Assets.icGoogle,
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(width: 50),
                            Text(
                              "Sign In with Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1877F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Image.asset(
                              Assets.icFacebook,
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              "Sign In with Facebook",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text("Don’t have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterMain(
                                  title: '',
                                ),
                              ));
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              // color: CustomColors.buttonColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
