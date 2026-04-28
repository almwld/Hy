import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  final String supportPhone = '777XXXXXX';
  final String supportEmail = 'support@sehatak.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدعم الفني'), centerTitle: true),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(gradient: AppColors.primaryGradient),
            child: Column(
              children: [
                const Icon(Icons.support_agent, size: 60, color: Colors.white),
                const SizedBox(height: 12),
                const Text('مركز المساعدة', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => launchUrl(Uri.parse('tel:$supportPhone')),
                        icon: const Icon(Icons.phone),
                        label: const Text('اتصل بنا'),
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => launchUrl(Uri.parse('mailto:$supportEmail')),
                        icon: const Icon(Icons.email),
                        label: const Text('راسلنا'),
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _FaqItem(question: 'كيف يمكنني حجز موعد؟', answer: 'يمكنك حجز موعد من خلال شاشة الاستشارات'),
          _FaqItem(question: 'كيف أتابع طلبي؟', answer: 'يمكنك تتبع طلبك من خلال شاشة طلباتي'),
          _FaqItem(question: 'ما هي طرق الدفع المتاحة؟', answer: 'نقبل الدفع عبر المحافظ الإلكترونية والتحويل البنكي'),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 0,
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w500)),
        children: [Padding(padding: const EdgeInsets.all(16), child: Text(answer))],
      ),
    );
  }
}
