import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class OrderStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  
  const OrderStepper({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) => _StepItem(
        title: steps[index],
        isActive: index <= currentStep,
        isLast: index == steps.length - 1,
      )),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;
  
  const _StepItem({
    required this.title,
    required this.isActive,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(isActive ? Icons.check : Icons.access_time, size: 16, color: Colors.white),
            ),
            if (!isLast) Container(width: 2, height: 40, color: isActive ? AppColors.primary : Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal))),
      ],
    );
  }
}
