import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const AppIcon({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.health_and_safety, size: size, color: color);
  }
}
