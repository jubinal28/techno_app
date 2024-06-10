import 'package:flutter/material.dart';
import 'package:techno_app/authentication/register/components/register_body.dart';

import '../../constants/assets.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({super.key, required String title});

  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
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
        body: const RegisterBody(
          title: '',
        ),
      ),
    );
  }
}
