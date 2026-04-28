import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'تذكير بموعد طبي',
        'body': 'لديك موعد مع د. سارة أحمد غداً الساعة 14:30',
        'time': 'منذ ساعة',
        'isRead': false,
        'icon': Icons.calendar_today,
        'color': AppColors.primary,
      },
      {
        'title': 'تم توصيل الطلب',
        'body': 'تم توصيل طلبك رقم #12345 بنجاح',
        'time': 'منذ 3 ساعات',
        'isRead': true,
        'icon': Icons.local_shipping,
        'color': AppColors.success,
      },
      {
        'title': 'عرض خاص',
        'body': 'احصل على خصم 20% على استشارة طبية عبر الفيديو',
        'time': 'منذ يوم',
        'isRead': true,
        'icon': Icons.local_offer,
        'color': AppColors.accent,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('تعليم الكل مقروء', style: GoogleFonts.cairo(fontSize: 12)),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            color: (notification['isRead'] as bool) ? null : AppColors.primary.withOpacity(0.05),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (notification['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(notification['icon'] as IconData, color: notification['color'] as Color),
              ),
              title: Text(
                notification['title'] as String,
                style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['body'] as String,
                    style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['time'] as String,
                    style: GoogleFonts.cairo(fontSize: 10, color: AppColors.lightGrey),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
