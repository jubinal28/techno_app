import 'package:flutter/material.dart';
import 'package:techno_app/constants/colors.dart';

import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

class CPasswordField extends StatefulWidget {
  final TextEditingController cpasswordController;
  final TextEditingController passwordController;

  CPasswordField(
      {Key? key,
      required this.cpasswordController,
      required this.passwordController})
      : super(key: key);

  @override
  State<CPasswordField> createState() => _CPasswordFieldState();
}

class _CPasswordFieldState extends State<CPasswordField> {
  bool isVisible = false;

  String cpassed = "123456";

  RegExp get passwordRegExp =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTextField(
            key: const Key('loginForm_passwordInput_textField'),
            height: 70,
            controller: widget.cpasswordController,
            obscureText: !isVisible,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: widget.cpasswordController.text.isEmpty
                  ? CustomColors.borderColor
                  : passwordRegExp.hasMatch(widget.cpasswordController.text)
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
            hintText: 'Confirm Password',
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            regex: passwordRegExp,
            onChanged: (value) {
              setState(
                () {
                  cpassed = value;
                },
              );
            },
            validator: (cpassed) {
              if (cpassed == null || cpassed.isEmpty) {
                return StringValidations.cpassEmpty;
              } else if (!passwordRegExp.hasMatch(cpassed)) {
                return StringValidations.cpassWrong;
              } else if (widget.passwordController.text !=
                  widget.cpasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.cpasswordController.text.isEmpty
                    ? ''
                    : widget.cpasswordController.text ==
                            widget.passwordController.text
                        ? 'Passwords match'
                        : 'Passwords do not match',
                style: TextStyle(
                  color: widget.cpasswordController.text.isEmpty
                      ? Colors.transparent
                      : widget.cpasswordController.text ==
                              widget.passwordController.text
                          ? Colors.green
                          : Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
