import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final VoidCallback onProfileTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onLogoutTap;
  
  const CustomDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.onProfileTap,
    required this.onSettingsTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      userName.isNotEmpty ? userName[0] : 'U',
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(userName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(userEmail, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.primary),
            title: const Text('الملف الشخصي'),
            onTap: onProfileTap,
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.primary),
            title: const Text('الإعدادات'),
            onTap: onSettingsTap,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            onTap: onLogoutTap,
          ),
        ],
      ),
    );
  }
}
