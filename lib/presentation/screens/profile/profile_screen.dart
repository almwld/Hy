import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حسابي'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
                  child: const Center(child: Text('أ', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('أحمد محمد', style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('ahmed@example.com', style: GoogleFonts.cairo(fontSize: 14, color: AppColors.grey)),
                      const SizedBox(height: 8),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Text('عضو أساسي', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.primary))),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _StatCard(icon: Icons.people_outline, value: '12', label: 'استشارة'),
                const SizedBox(width: 12),
                _StatCard(icon: Icons.medication_outlined, value: '8', label: 'طلب دواء'),
                const SizedBox(width: 12),
                _StatCard(icon: Icons.star_outline, value: '4.9', label: 'تقييمي'),
              ],
            ),
          ),
          _MenuItem(icon: Icons.medical_information_outlined, title: 'سجلي الطبي', onTap: () {}),
          _MenuItem(icon: Icons.subscriptions_outlined, title: 'باقات العضوية', onTap: () {}),
          _MenuItem(icon: Icons.payment_outlined, title: 'طرق الدفع', onTap: () {}),
          _MenuItem(icon: Icons.notifications_outlined, title: 'الإشعارات', onTap: () {}),
          _MenuItem(icon: Icons.language_outlined, title: 'اللغة', trailing: const Text('العربية'), onTap: () {}),
          _MenuItem(
            icon: Icons.dark_mode_outlined, title: 'الوضع المظلم',
            trailing: Switch(value: false, onChanged: (_) {}, activeColor: AppColors.primary),
            onTap: () {},
          ),
          const Divider(),
          _MenuItem(icon: Icons.settings_outlined, title: 'الإعدادات', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
          }),
          _MenuItem(icon: Icons.info_outline, title: 'عن التطبيق', onTap: () {}),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.error)),
              child: const Text('تسجيل الخروج', style: TextStyle(color: AppColors.error)),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon; final String value; final String label;
  const _StatCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(icon, size: 24, color: AppColors.primary),
            const SizedBox(height: 4),
            Text(value, style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: GoogleFonts.cairo(fontSize: 10, color: AppColors.grey)),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon; final String title; final Widget? trailing; final VoidCallback onTap;
  const _MenuItem({required this.icon, required this.title, this.trailing, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: GoogleFonts.cairo()),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
