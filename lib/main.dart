import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_strings.dart';
import 'core/themes/light_theme.dart';
import 'core/themes/dark_theme.dart';
import 'presentation/bloc/theme/theme_event.dart';
import 'presentation/bloc/theme/theme_state.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/auth/auth_event.dart';
import 'presentation/bloc/auth/auth_state.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/register_screen.dart';
import 'presentation/screens/auth/forgot_password_screen.dart';
import 'presentation/screens/auth/otp_verification_screen.dart';
import 'presentation/screens/home/main_navigation.dart';
import 'presentation/screens/doctor/doctor_details_screen.dart';
import 'presentation/screens/consultation/consultations_screen.dart';
import 'presentation/screens/pharmacy/pharmacy_screen.dart';
import 'presentation/screens/profile/profile_screen.dart';
import 'presentation/screens/emergency/emergency_screen.dart';
import 'presentation/screens/health_tips/health_tips_screen.dart';
import 'presentation/screens/support/support_screen.dart';
import 'presentation/screens/payment/payment_screen.dart';
import 'presentation/screens/payment/yemen_payment_screen.dart';
import 'presentation/screens/booking/booking_screen.dart';
import 'presentation/screens/order/order_tracking_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';
import 'presentation/screens/notifications/notifications_screen.dart';
import 'presentation/screens/search/search_screen.dart';
import 'domain/repositories/auth_repository.dart';
import 'services/cache_service.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // تهيئة الخدمات
  await CacheService().init();
  await NotificationService().init();
  
  // تثبيت الاتجاه
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  runApp(const SehatakApp());
}

class SehatakApp extends StatelessWidget {
  const SehatakApp({super.key});

  @override
  Widget build(BuildContext context) {
    // إنشاء AuthRepository
    final authRepository = AuthRepository();

    return MultiBlocProvider(
      providers: [
        // Auth Bloc
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: authRepository)..add(CheckAuthEvent()),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.theme,
        darkTheme: AppDarkTheme.theme,
        themeMode: ThemeMode.light,
        
        // الصفحة الرئيسية - Splash
        home: const SplashScreen(),
        
        // إعدادات المسارات
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgot_password': (context) => const ForgotPasswordScreen(),
          '/otp_verification': (context) => const OTPVerificationScreen(),
          '/home': (context) => const MainNavigation(),
          '/doctor_details': (context) => const DoctorDetailsScreen(),
          '/consultations': (context) => const ConsultationsScreen(),
          '/pharmacy': (context) => const PharmacyScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/emergency': (context) => const EmergencyScreen(),
          '/health_tips': (context) => const HealthTipsScreen(),
          '/support': (context) => const SupportScreen(),
          '/payment': (context) => const PaymentScreen(),
          '/yemen_payment': (context) => const YemenPaymentScreen(),
          '/booking': (context) => const BookingScreen(),
          '/order_tracking': (context) => const OrderTrackingScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/notifications': (context) => const NotificationsScreen(),
          '/search': (context) => const SearchScreen(),
        },
        
        // الإعدادات المحلية
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          DefaultMaterialLocalization.delegate,
          DefaultWidgetsLocalization.delegate,
        ],
      ),
    );
  }
}
