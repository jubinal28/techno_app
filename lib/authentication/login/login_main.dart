import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import 'components/login_body.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key, required String title});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
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
        body: const LoginBody(
          title: '',
        ),
      ),
    );
  }
}
