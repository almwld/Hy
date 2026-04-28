import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool useSecondary;

  const GradientBackground({super.key, required this.child, this.useSecondary = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: useSecondary ? AppColors.secondaryGradient : AppColors.primaryGradient,
      ),
      child: child,
    );
  }
}
