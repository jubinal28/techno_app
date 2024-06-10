import 'package:flutter/material.dart';
import 'package:techno_app/sharedstate/shared_state.dart';
import '../../../constants/colors.dart';
import '../../../constants/liststring.dart';
import '../../../widget/custom_textfield_widget.dart';

class VcodeField extends StatefulWidget {
  final TextEditingController vcodeController;

  VcodeField({Key? key, required this.vcodeController}) : super(key: key);

  @override
  State<VcodeField> createState() => _VcodeFieldState();
}

class _VcodeFieldState extends State<VcodeField> {
  String vc = "1234";
  RegExp get numbersOnlyRegExp => RegExp(r'^[0-9]{6}$');
  double verificationFieldHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: SharedState.isButtonPressedNotifier,
      builder: (context, isButtonPressed, child) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    key: const Key('loginForm_usernameInput_textField'),
                    readOnly: !isButtonPressed,
                    shrink: !isButtonPressed,
                    height: verificationFieldHeight,
                    controller: widget.vcodeController,
                    obscureText: false,
                    hintText: 'Verification Code',
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    regex: numbersOnlyRegExp,
                    prefixIcon: Icon(
                      Icons.numbers_outlined,
                      color: widget.vcodeController.text.isEmpty
                          ? CustomColors.borderColor
                          : numbersOnlyRegExp
                                  .hasMatch(widget.vcodeController.text)
                              ? CustomColors.primaryColor
                              : CustomColors.errorColor,
                    ),
                    onChanged: (value) {
                      setState(() {
                        vc = value;
                      });
                    },
                    validator: (vc) {
                      if (vc == null || vc.isEmpty) {
                        return StringValidations.vcodeEmpty;
                      } else if (!numbersOnlyRegExp.hasMatch(vc)) {
                        return StringValidations.vcodeWrong;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
