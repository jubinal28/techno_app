import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../widget/custom_indicator_carousel.dart';
import 'components/home_vouchers.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key, required String title});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final List<String> items = [
    Assets.splashlogo,
    Assets.splashlogo,
    Assets.splashlogo,
  ];
  int _selectedPageIndex = 0;
  int _selectedIndicator = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectIndicator(int index) {
    setState(() {
      _selectedIndicator = index;
    });
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool end = false;
  var _isVisible = true;
  @override
  initState() {
    super.initState();
    _isVisible = true;

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage == 2) {
        end = true;
      } else if (_currentPage == 1) {
        end = true;
      } else if (_currentPage == 0) {
        end = true;
      }

      if (end == true) {
        _currentPage++;
      } else {
        _currentPage++;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return CarouselItem(
                          imagePath: items[index % items.length],
                        );
                      },
                      onPageChanged: _selectIndicator,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: CustomIndicatorWidget(
                        currentIndex: _selectedIndicator,
                        length: items.length,
                      ),
                    ),
                  ],
                ),
              ),
              //put here all the other in home
              HomeVouchers(),
            ],
          ),
        ));
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;

  const CarouselItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
