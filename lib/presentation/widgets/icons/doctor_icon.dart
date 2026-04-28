import 'package:flutter/material.dart';

class DoctorIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const DoctorIcon({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.person, size: size, color: color);
  }
}
