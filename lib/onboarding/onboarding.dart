import 'package:flutter/material.dart';

import '../authentication/login/login_main.dart';
import 'unboardlist.dart';

class Onboardings extends StatefulWidget {
  const Onboardings({super.key, required String title});

  @override
  State<Onboardings> createState() => _OnboardingsState();
}

class _OnboardingsState extends State<Onboardings> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Image.asset(
                        contents[i].assets,
                        height: 300,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: MediaQuery.of(context).size.width * .9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                currentIndex == contents.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginMain(
                          title: '',
                        ),
                      ));
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            ),
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginMain(title: '')));
                },
                child: const Text(
                  'Skip',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    Color dotColor =
        currentIndex == index ? Colors.black : const Color(0xFFF8F8F8);
    return Container(
      height: 10,
      width: currentIndex == index ? 40 : 10,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30),
        color: dotColor,
      ),
    );
  }
}
