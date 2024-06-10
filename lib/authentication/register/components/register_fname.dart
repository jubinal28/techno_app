import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

// ignore: must_be_immutable
class FnameField extends StatefulWidget {
  final TextEditingController fnameController;

  FnameField({Key? key, required this.fnameController}) : super(key: key);

  @override
  State<FnameField> createState() => _FnameFieldState();
}

class _FnameFieldState extends State<FnameField> {
  String fn = "reinier";

  RegExp get firstlastnameRegExp =>
      RegExp(r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                  ),
                ),
              ),
              CustomTextField(
                key: const Key('loginForm_usernameInput_textField'),
                height: 70,
                controller: widget.fnameController,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.people_alt_outlined,
                  color: widget.fnameController.text.isEmpty
                      ? CustomColors.borderColor
                      : firstlastnameRegExp
                              .hasMatch(widget.fnameController.text)
                          ? CustomColors.primaryColor
                          : CustomColors.errorColor,
                ),
                hintText: 'First Name',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                regex: firstlastnameRegExp,
                onChanged: (value) {
                  setState(
                    () {
                      fn = value;
                    },
                  );
                },
                validator: (fn) {
                  if (fn == null || fn.isEmpty) {
                    return StringValidations.fnameEmpty;
                  } else if (!firstlastnameRegExp.hasMatch(fn)) {
                    return StringValidations.fnameWrong;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
