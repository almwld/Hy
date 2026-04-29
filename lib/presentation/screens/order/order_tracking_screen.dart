import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class OrderTrackingScreen extends StatelessWidget {
  final String orderId;
  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تتبع الطلب'), centerTitle: true),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.primary.withOpacity(0.1),
            child: Row(
              children: [
                Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.shopping_bag, color: AppColors.primary)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رقم الطلب: #$orderId', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Text('صيدلية العز', style: TextStyle(fontSize: 12, color: AppColors.grey)),
                    ],
                  ),
                ),
                Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)), child: const Text('قيد التنفيذ', style: TextStyle(fontSize: 12, color: Colors.green))),
              ],
            ),
          ),
          Expanded(
            child: Stepper(
              currentStep: 1,
              controlsBuilder: (context, details) => const SizedBox(),
              physics: const NeverScrollableScrollPhysics(),
              steps: [
                Step(title: const Text('تم الاستلام'), content: const SizedBox(), isActive: true),
                Step(title: const Text('قيد التحضير'), content: const SizedBox(), isActive: true),
                Step(title: const Text('تم التجهيز'), content: const SizedBox(), isActive: false),
                Step(title: const Text('قيد التوصيل'), content: const SizedBox(), isActive: false),
                Step(title: const Text('تم التسليم'), content: const SizedBox(), isActive: false),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: Column(
              children: [
                Row(children: [const Icon(Icons.location_on, color: AppColors.primary), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('عنوان التوصيل', style: TextStyle(fontSize: 12, color: AppColors.grey)), const Text('شارع الملك فهد، حي النخيل، الرياض')]))]),
                const SizedBox(height: 12),
                Row(children: [const Icon(Icons.access_time, color: AppColors.primary), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('الوقت المتوقع', style: TextStyle(fontSize: 12, color: AppColors.grey)), const Text('30-45 دقيقة')]))]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
