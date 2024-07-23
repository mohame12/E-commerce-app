import 'package:flutter/material.dart';

class CategoryTabBarItem extends StatelessWidget {
  const CategoryTabBarItem({
    super.key, required this.text,

  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(text),
      ),
    );
  }
}