import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  final String ambulanceNumber = '997';
  final String policeNumber = '999';
  final String fireNumber = '998';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red.shade700, Colors.red.shade900],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.emergency, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'خدمات الطوارئ',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _EmergencyButton(title: 'الإسعاف', number: ambulanceNumber, icon: Icons.local_hospital),
                    const SizedBox(height: 16),
                    _EmergencyButton(title: 'الدفاع المدني', number: fireNumber, icon: Icons.fire_truck),
                    const SizedBox(height: 16),
                    _EmergencyButton(title: 'الشرطة', number: policeNumber, icon: Icons.local_police),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmergencyButton extends StatelessWidget {
  final String title;
  final String number;
  final IconData icon;
  
  const _EmergencyButton({
    required this.title,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.2),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () async {
          final url = Uri.parse('tel:$number');
          if (await canLaunchUrl(url)) await launchUrl(url);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, size: 30, color: Colors.red.shade700),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Text(number, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
