import 'package:flutter/material.dart';
import 'package:techno_app/constants/colors.dart';

import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  PasswordField({Key? key, required this.passwordController}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  String passed = "123456";

  RegExp get passwordRegExp =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CustomTextField(
        key: const Key('loginForm_passwordInput_textField'),
        height: 70,
        controller: widget.passwordController,
        obscureText: !isVisible,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: widget.passwordController.text.isEmpty
              ? CustomColors.borderColor
              : passwordRegExp.hasMatch(widget.passwordController.text)
                  ? CustomColors.primaryColor
                  : CustomColors.errorColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        regex: passwordRegExp,
        onChanged: (value) {
          setState(
            () {
              passed = value;
            },
          );
        },
        validator: (passed) {
          if (passed == null || passed.isEmpty) {
            return StringValidations.passEmpty;
          } else if (!passwordRegExp.hasMatch(passed)) {
            return StringValidations.passWrong;
          }
          return null;
        },
      ),
    );
  }
}
