import 'package:flutter/material.dart';

class NavSelectedIcon extends StatelessWidget {
  const NavSelectedIcon({
    super.key, required this.icon, required this.color,
  });
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children:[ Icon(icon),
          Positioned(left: 9,top: 23,child: CircleAvatar(radius: 3,backgroundColor: color,))
        ]);
  }
}