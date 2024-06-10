import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/assets.dart';
import '../onboarding/onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required String title});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const Onboardings(
                title: '',
              )));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: Image.asset(
            Assets.logoFood,
            height: 112,
          )),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
