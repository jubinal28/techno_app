import 'package:flutter/material.dart';
import 'package:techno_app/authentication/forgot/components/forgot_body.dart';

import '../../constants/assets.dart';

class ForgotMain extends StatefulWidget {
  const ForgotMain({super.key, required String title});

  @override
  State<ForgotMain> createState() => _ForgotMainState();
}

class _ForgotMainState extends State<ForgotMain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              Assets.backbutton,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const ForgotBody(
          title: '',
        ),
      ),
    );
  }
}
