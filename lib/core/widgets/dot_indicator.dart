import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.length, required this.index});

  final int length;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  DotsIndicator(
      dotsCount: length,
      position: index,
      decorator: DotsDecorator(
        activeColor: defColor,

        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
