import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class HealthTipsScreen extends StatelessWidget {
  const HealthTipsScreen({super.key});

  final List<Map<String, dynamic>> _tips = const [
    {'title': 'شرب الماء', 'description': 'اشرب 8 أكواب ماء يومياً', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'title': 'النوم الكافي', 'description': 'نام 7-8 ساعات يومياً', 'icon': Icons.nights_stay, 'color': Colors.purple},
    {'title': 'الغذاء الصحي', 'description': 'تناول خضروات وفواكه طازجة', 'icon': Icons.restaurant, 'color': Colors.green},
    {'title': 'الرياضة', 'description': 'مارس الرياضة 30 دقيقة يومياً', 'icon': Icons.fitness_center, 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('نصائح صحية'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tips.length,
        itemBuilder: (context, index) => _TipCard(tip: _tips[index]),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final Map<String, dynamic> tip;
  const _TipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(color: (tip['color'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
              child: Icon(tip['icon'], size: 30, color: tip['color']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tip['title'], style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(tip['description'], style: GoogleFonts.cairo(fontSize: 14, color: AppColors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
