import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  String _language = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات'), centerTitle: true),
      body: ListView(
        children: [
          _buildSection('الإشعارات', [
            SwitchListTile(title: const Text('إشعارات التطبيق'), value: _notifications, onChanged: (v) => setState(() => _notifications = v)),
          ]),
          _buildSection('المظهر', [
            SwitchListTile(title: const Text('الوضع المظلم'), value: _darkMode, onChanged: (v) => setState(() => _darkMode = v)),
            ListTile(title: const Text('اللغة'), trailing: DropdownButton<String>(
              value: _language,
              items: const [DropdownMenuItem(value: 'ar', child: Text('العربية')), DropdownMenuItem(value: 'en', child: Text('English'))],
              onChanged: (v) => setState(() => _language = v!),
            )),
          ]),
          _buildSection('البيانات', [
            ListTile(leading: const Icon(Icons.backup), title: const Text('نسخ احتياطي'), onTap: () {}),
            ListTile(leading: const Icon(Icons.restore), title: const Text('استعادة البيانات'), onTap: () {}),
          ]),
          _buildSection('حول', [
            ListTile(leading: const Icon(Icons.info), title: const Text('الإصدار'), subtitle: const Text('1.0.0'), onTap: () {}),
            ListTile(leading: const Icon(Icons.privacy_tip), title: const Text('سياسة الخصوصية'), onTap: () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(16), child: Text(title, style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold))),
          ...children,
        ],
      ),
    );
  }
}
