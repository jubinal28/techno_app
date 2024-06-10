import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

// ignore: must_be_immutable
class EmailField extends StatefulWidget {
  final TextEditingController emailController;

  EmailField({Key? key, required this.emailController}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String em = "reinier@gmail";

  RegExp get _emailRegex => RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                key: const Key('loginForm_usernameInput_textField'),
                height: 70,
                controller: widget.emailController,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.alternate_email_outlined,
                  color: widget.emailController.text.isEmpty
                      ? CustomColors.borderColor
                      : _emailRegex.hasMatch(widget.emailController.text)
                          ? CustomColors.primaryColor
                          : CustomColors.errorColor,
                ),
                hintText: 'Email Address / Username',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                regex: _emailRegex,
                onChanged: (value) {
                  setState(
                    () {
                      em = value;
                    },
                  );
                },
                validator: (em) {
                  if (em == null || em.isEmpty) {
                    return StringValidations.emailEmpty;
                  } else if (!_emailRegex.hasMatch(em)) {
                    return StringValidations.emailWrong;
                  }
                  return null;
                },
              ),

              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const RegisterScreen(
              //               title: '',
              //             ),
              //           ),
              //         ),
              //         child: const Text(
              //           'Sign Up',
              //           style: TextStyle(color: CustomColors.primaryColor),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const ForgotScreen(
              //               title: '',
              //             ),
              //           ),
              //         ),
              //         child: const Text(
              //           'Forgot Password',
              //           style: TextStyle(color: CustomColors.primaryColor),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
