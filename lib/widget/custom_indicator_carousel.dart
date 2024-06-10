import 'package:flutter/material.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: currentIndex % length == i
                  ? Colors.blueAccent
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
      ],
    );
  }
}
