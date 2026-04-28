import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _currentStep = 1;

  final List<OrderStep> _steps = [
    OrderStep(title: 'تم الاستلام', icon: Icons.check_circle, time: '10:30'),
    OrderStep(title: 'قيد التحضير', icon: Icons.local_pharmacy, time: '10:45'),
    OrderStep(title: 'تم التجهيز', icon: Icons.inventory_2, time: null),
    OrderStep(title: 'قيد التوصيل', icon: Icons.delivery_dining, time: null),
    OrderStep(title: 'تم التسليم', icon: Icons.home, time: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تتبع الطلب'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.primary.withOpacity(0.1),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.shopping_bag, color: AppColors.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'رقم الطلب: #${widget.orderId}',
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'صيدلية العز',
                        style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'قيد التنفيذ',
                    style: GoogleFonts.cairo(fontSize: 12, color: Colors.green, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stepper(
              currentStep: _currentStep,
              controlsBuilder: (context, details) => const SizedBox(),
              physics: const NeverScrollableScrollPhysics(),
              stepIconBuilder: (stepIndex, stepState) {
                final step = _steps[stepIndex];
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: stepIndex <= _currentStep ? AppColors.primary : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(step.icon, color: Colors.white, size: 20),
                );
              },
              steps: _steps.map((step) => Step(
                title: Text(step.title, style: GoogleFonts.cairo(fontWeight: FontWeight.w500)),
                subtitle: step.time != null
                    ? Text(step.time!, style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey))
                    : null,
                content: const SizedBox(),
                isActive: true,
              )).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('عنوان التوصيل', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
                            Text('شارع الملك فهد، حي النخيل، الرياض',
                                style: GoogleFonts.cairo(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('الوقت المتوقع', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
                            Text('30-45 دقيقة', style: GoogleFonts.cairo(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat),
                      label: const Text('التواصل مع الدعم'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStep {
  final String title;
  final IconData icon;
  final String? time;

  OrderStep({required this.title, required this.icon, this.time});
}
