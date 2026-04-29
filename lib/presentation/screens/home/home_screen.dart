import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../consultation/consultations_screen.dart';
import '../pharmacy/pharmacy_screen.dart';
import '../profile/profile_screen.dart';
import '../doctor/doctor_details_screen.dart';
import '../emergency/emergency_screen.dart';
import '../health_tips/health_tips_screen.dart';
import '../support/support_screen.dart';
import '../payment/yemen_payment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const HomeContent(),
    const ConsultationsScreen(),
    const PharmacyScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat_bubble), label: 'الاستشارات'),
          BottomNavigationBarItem(icon: Icon(Icons.local_pharmacy_outlined), activeIcon: Icon(Icons.local_pharmacy), label: 'الصيدلية'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColors.primaryGradient),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.health_and_safety, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('صحتك', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('تطبيقك الطبي المتكامل', style: TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('الرئيسية'), onTap: () { Navigator.pop(context); setState(() => _currentIndex = 0); }),
          ListTile(leading: const Icon(Icons.chat), title: const Text('الاستشارات'), onTap: () { Navigator.pop(context); setState(() => _currentIndex = 1); }),
          ListTile(leading: const Icon(Icons.local_pharmacy), title: const Text('الصيدلية'), onTap: () { Navigator.pop(context); setState(() => _currentIndex = 2); }),
          ListTile(leading: const Icon(Icons.person), title: const Text('حسابي'), onTap: () { Navigator.pop(context); setState(() => _currentIndex = 3); }),
          const Divider(),
          ListTile(leading: const Icon(Icons.emergency, color: Colors.red), title: const Text('طوارئ', style: TextStyle(color: Colors.red)), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const EmergencyScreen())); }),
          ListTile(leading: const Icon(Icons.healing), title: const Text('نصائح صحية'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const HealthTipsScreen())); }),
          ListTile(leading: const Icon(Icons.support_agent), title: const Text('الدعم الفني'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportScreen())); }),
          ListTile(leading: const Icon(Icons.payment), title: const Text('الدفع'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const YemenPaymentScreen())); }),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('مرحباً بك في صحتك', style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
            background: Container(
              decoration: BoxDecoration(gradient: AppColors.primaryGradient),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text('اهلاً بك 👋', style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text('كيف يمكننا مساعدتك اليوم؟', style: GoogleFonts.cairo(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.1),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final services = [
                  {'icon': Icons.chat, 'title': 'استشارة طبية', 'color': AppColors.primary, 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConsultationsScreen()))},
                  {'icon': Icons.local_pharmacy, 'title': 'طلب أدوية', 'color': AppColors.secondary, 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PharmacyScreen()))},
                  {'icon': Icons.emergency, 'title': 'طوارئ', 'color': Colors.red, 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmergencyScreen()))},
                  {'icon': Icons.healing, 'title': 'نصائح صحية', 'color': Colors.green, 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HealthTipsScreen()))},
                ];
                final service = services[index];
                return _ServiceCard(
                  icon: service['icon'] as IconData,
                  title: service['title'] as String,
                  color: service['color'] as Color,
                  onTap: service['onTap'] as VoidCallback,
                );
              },
              childCount: 4,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('أطباء مميزون', style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final doctors = [
                        {'name': 'د. أحمد محمد', 'specialty': 'أمراض القلب', 'rating': 4.8},
                        {'name': 'د. سارة علي', 'specialty': 'أمراض جلدية', 'rating': 4.9},
                        {'name': 'د. خالد محمود', 'specialty': 'أطفال', 'rating': 4.7},
                      ];
                      return _DoctorCard(
                        doctor: doctors[index],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetailsScreen(doctor: {...doctors[index], 'reviewsCount': 120, 'experience': '10 سنوات', 'clinicAddress': 'شارع الملك فهد، الرياض', 'consultationPrice': 150}))),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon; final String title; final Color color; final VoidCallback onTap;
  const _ServiceCard({required this.icon, required this.title, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 60, height: 60, decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(16)), child: Icon(icon, size: 30, color: color)),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor; final VoidCallback onTap;
  const _DoctorCard({required this.doctor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 120, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: const BorderRadius.vertical(top: Radius.circular(16))), child: const Center(child: Icon(Icons.person, size: 50, color: AppColors.primary))),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor['name'], style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(doctor['specialty'], style: GoogleFonts.cairo(fontSize: 12, color: AppColors.grey)),
                    const SizedBox(height: 8),
                    Row(children: [const Icon(Icons.star, size: 14, color: Colors.amber), const SizedBox(width: 4), Text(doctor['rating'].toString(), style: GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.bold))]),
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
