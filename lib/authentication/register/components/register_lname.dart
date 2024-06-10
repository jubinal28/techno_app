import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

// ignore: must_be_immutable
class LnameField extends StatefulWidget {
  final TextEditingController lnameController;

  LnameField({Key? key, required this.lnameController}) : super(key: key);

  @override
  State<LnameField> createState() => _LnameFieldState();
}

class _LnameFieldState extends State<LnameField> {
  String ln = "reinier";

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
              CustomTextField(
                key: const Key('loginForm_usernameInput_textField'),
                height: 70,
                controller: widget.lnameController,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.people_alt_outlined,
                  color: widget.lnameController.text.isEmpty
                      ? CustomColors.borderColor
                      : firstlastnameRegExp
                              .hasMatch(widget.lnameController.text)
                          ? CustomColors.primaryColor
                          : CustomColors.errorColor,
                ),
                hintText: 'Last Name',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                regex: firstlastnameRegExp,
                onChanged: (value) {
                  setState(
                    () {
                      ln = value;
                    },
                  );
                },
                validator: (ln) {
                  if (ln == null || ln.isEmpty) {
                    return StringValidations.lnameEmpty;
                  } else if (!firstlastnameRegExp.hasMatch(ln)) {
                    return StringValidations.lnameWrong;
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
