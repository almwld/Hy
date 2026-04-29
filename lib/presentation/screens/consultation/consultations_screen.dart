import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class ConsultationsScreen extends StatefulWidget {
  const ConsultationsScreen({super.key});

  @override
  State<ConsultationsScreen> createState() => _ConsultationsScreenState();
}

class _ConsultationsScreenState extends State<ConsultationsScreen> {
  final List<Map<String, dynamic>> _consultations = [
    {'id': 1, 'doctor': 'د. سارة أحمد', 'specialty': 'أمراض جلدية', 'date': '2024-03-20', 'time': '14:30', 'status': 'upcoming', 'rating': 4.9},
    {'id': 2, 'doctor': 'د. محمد علي', 'specialty': 'طب نفسي', 'date': '2024-03-18', 'time': '11:00', 'status': 'completed', 'rating': 4.7},
    {'id': 3, 'doctor': 'د. نورة خالد', 'specialty': 'أطفال', 'date': '2024-03-15', 'time': '09:00', 'status': 'completed', 'rating': 5.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('الاستشارات', style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(gradient: AppColors.secondaryGradient),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                              child: const Icon(Icons.chat_bubble_outline, color: AppColors.secondary, size: 28),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('خدمة الاستشارات الطبية', style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                  const SizedBox(height: 4),
                                  Text('تواصل مع أفضل الأطباء في مختلف التخصصات', style: GoogleFonts.cairo(fontSize: 12, color: Colors.white70)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [IconButton(icon: const Icon(Icons.filter_list), onPressed: () {})],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _ConsultationCard(consultation: _consultations[index]),
                childCount: _consultations.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('استشارة جديدة'),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}

class _ConsultationCard extends StatelessWidget {
  final Map<String, dynamic> consultation;
  const _ConsultationCard({required this.consultation});

  @override
  Widget build(BuildContext context) {
    final isUpcoming = consultation['status'] == 'upcoming';
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.person, size: 30, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(consultation['doctor'], style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(consultation['specialty'], style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 12, color: AppColors.grey),
                      const SizedBox(width: 4),
                      Text('${consultation['date']} • ${consultation['time']}', style: GoogleFonts.cairo(fontSize: 11, color: AppColors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: (isUpcoming ? Colors.green : AppColors.grey).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Text(isUpcoming ? 'قادمة' : 'مكتملة', style: GoogleFonts.cairo(fontSize: 10, color: isUpcoming ? Colors.green : AppColors.grey)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(consultation['rating'].toString(), style: GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
