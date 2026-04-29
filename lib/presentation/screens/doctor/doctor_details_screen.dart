import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(gradient: AppColors.primaryGradient),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)],
                        ),
                        child: const Center(child: Icon(Icons.person, size: 60, color: AppColors.primary)),
                      ),
                      const SizedBox(height: 16),
                      Text(doctor['name'], style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text(doctor['specialty'], style: GoogleFonts.cairo(fontSize: 16, color: Colors.white70)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(doctor['rating'].toString(), style: GoogleFonts.cairo(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Text('(${doctor['reviewsCount']} تقييم)', style: GoogleFonts.cairo(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _InfoSection(
                    title: 'نبذة عن الطبيب',
                    children: [
                      _InfoRow(icon: Icons.work_outline, label: 'الخبرة', value: doctor['experience']),
                      _InfoRow(icon: Icons.location_on_outlined, label: 'العنوان', value: doctor['clinicAddress']),
                      _InfoRow(icon: Icons.attach_money, label: 'قيمة الكشف', value: '${doctor['consultationPrice']} ريال'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InfoSection(
                    title: 'تقييمات المرضى',
                    children: [
                      _ReviewCard(name: 'أحمد محمد', rating: 5, comment: 'دكتور ممتاز جداً', date: 'منذ 3 أيام'),
                      _ReviewCard(name: 'نورة سعد', rating: 4, comment: 'مواعيده منظمة', date: 'منذ أسبوع'),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.primary)),
                  child: const Text('رسالة'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  child: const Text('حجز موعد'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _InfoSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon; final String label; final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 12),
          SizedBox(width: 100, child: Text(label, style: GoogleFonts.cairo(fontSize: 14, color: AppColors.grey))),
          Expanded(child: Text(value, style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String name; final int rating; final String comment; final String date;
  const _ReviewCard({required this.name, required this.rating, required this.comment, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 16, backgroundColor: AppColors.primary.withOpacity(0.1), child: Text(name[0], style: const TextStyle(color: AppColors.primary))),
              const SizedBox(width: 8),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500)),
                  Row(children: List.generate(5, (i) => Icon(i < rating ? Icons.star : Icons.star_border, size: 14, color: Colors.amber))),
                ],
              )),
              Text(date, style: GoogleFonts.cairo(fontSize: 10, color: AppColors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment, style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
        ],
      ),
    );
  }
}
