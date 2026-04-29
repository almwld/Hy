import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {'title': 'مرحباً بك في صحتك', 'description': 'تطبيقك الطبي المتكامل للرعاية الصحية عن بعد', 'icon': Icons.health_and_safety},
    {'title': 'استشارات طبية فورية', 'description': 'تواصل مع أفضل الأطباء في مختلف التخصصات', 'icon': Icons.chat},
    {'title': 'صيدلية إلكترونية', 'description': 'اطلب أدويتك واحصل عليها في أسرع وقت', 'icon': Icons.local_pharmacy},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) => _OnboardingPage(page: _pages[index]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? AppColors.primary : AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == _pages.length - 1) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  } else {
                    _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(_currentPage == _pages.length - 1 ? 'ابدأ الآن' : 'التالي'),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> page;
  const _OnboardingPage({required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(page['icon'], size: 60, color: AppColors.primary),
          ),
          const SizedBox(height: 40),
          Text(
            page['title'],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page['description'],
            style: const TextStyle(fontSize: 16, color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
