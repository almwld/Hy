# صحتك - منصة طبية متكاملة

## نظرة عامة

منصة "صحتك" هي تطبيق جوال طبي متكامل يوفر للمستخدمين:
- استشارات طبية مع أفضل الأطباء
- صيدلية إلكترونية لطلب الأدوية
- مساعد ذكي بالذكاء الاصطناعي
- سجل طبي إلكتروني
- حجز المواعيد
- تتبع الطلبات

## هيكل المشروع

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── api_endpoints.dart
│   │   └── app_assets.dart
│   ├── themes/
│   │   ├── light_theme.dart
│   │   └── dark_theme.dart
│   ├── utils/
│   │   ├── validators.dart
│   │   ├── helpers.dart
│   │   ├── date_formatter.dart
│   │   ├── error_handler.dart
│   │   └── network_info.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       ├── loading_indicator.dart
│       ├── error_widget.dart
│       ├── empty_state_widget.dart
│       ├── gradient_background.dart
│       ├── custom_app_bar.dart
│       ├── custom_bottom_nav_bar.dart
│       ├── custom_dialog.dart
│       ├── custom_snackbar.dart
│       └── shimmer_effect.dart
├── data/
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── doctor_model.dart
│   │   ├── consultation_model.dart
│   │   ├── pharmacy_model.dart
│   │   ├── order_model.dart
│   │   ├── prescription_model.dart
│   │   ├── subscription_model.dart
│   │   ├── payment_model.dart
│   │   ├── message_model.dart
│   │   ├── notification_model.dart
│   │   ├── review_model.dart
│   │   ├── schedule_model.dart
│   │   └── address_model.dart
│   ├── datasources/
│   │   ├── remote/
│   │   │   ├── api_client.dart
│   │   │   ├── auth_api.dart
│   │   │   ├── user_api.dart
│   │   │   ├── consultation_api.dart
│   │   │   ├── doctor_api.dart
│   │   │   ├── pharmacy_api.dart
│   │   │   ├── order_api.dart
│   │   │   ├── payment_api.dart
│   │   │   ├── notification_api.dart
│   │   │   └── ai_api.dart
│   │   └── local/
│   │       ├── storage_service.dart
│   │       ├── database_helper.dart
│   │       └── cache_manager.dart
│   └── repositories/
│       ├── auth_repository_impl.dart
│       ├── user_repository_impl.dart
│       ├── consultation_repository_impl.dart
│       └── order_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── user_entity.dart
│   │   ├── consultation_entity.dart
│   │   └── order_entity.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── user_repository.dart
│   │   └── consultation_repository.dart
│   └── usecases/
│       ├── auth/
│       │   ├── login_usecase.dart
│       │   ├── register_usecase.dart
│       │   ├── forgot_password_usecase.dart
│       │   ├── verify_otp_usecase.dart
│       │   └── logout_usecase.dart
│       ├── user/
│       │   ├── get_profile_usecase.dart
│       │   ├── update_profile_usecase.dart
│       │   └── get_medical_history_usecase.dart
│       └── consultation/
│           ├── start_consultation_usecase.dart
│           ├── get_consultations_usecase.dart
│           ├── get_consultation_details_usecase.dart
│           ├── send_message_usecase.dart
│           └── rate_consultation_usecase.dart
├── presentation/
│   ├── bloc/
│   │   ├── auth/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── consultation/
│   │   │   ├── consultation_bloc.dart
│   │   │   ├── consultation_event.dart
│   │   │   └── consultation_state.dart
│   │   ├── order/
│   │   │   ├── order_bloc.dart
│   │   │   ├── order_event.dart
│   │   │   └── order_state.dart
│   │   ├── subscription/
│   │   │   ├── subscription_bloc.dart
│   │   │   ├── subscription_event.dart
│   │   │   └── subscription_state.dart
│   │   └── theme/
│   │       ├── theme_bloc.dart
│   │       ├── theme_event.dart
│   │       └── theme_state.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   ├── forgot_password_screen.dart
│   │   │   └── otp_verification_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── consultation/
│   │   │   └── consultations_screen.dart
│   │   ├── doctor/
│   │   │   └── doctor_details_screen.dart
│   │   ├── pharmacy/
│   │   │   └── pharmacy_screen.dart
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   ├── notifications/
│   │   │   └── notifications_screen.dart
│   │   ├── search/
│   │   │   └── search_screen.dart
│   │   ├── payment/
│   │   │   └── payment_screen.dart
│   │   ├── booking/
│   │   │   └── booking_screen.dart
│   │   └── order/
│   │       └── order_tracking_screen.dart
│   └── widgets/
│       ├── icons/
│       ├── cards/
│       ├── chat/
│       └── steppers/
└── services/
    ├── notification_service.dart
    ├── location_service.dart
    ├── connectivity_service.dart
    └── analytics_service.dart
```

## المتطلبات

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

## التثبيت

```bash
# تنظيف المشروع
flutter clean

# تثبيت الحزم
flutter pub get

# تشغيل التطبيق
flutter run

# بناء APK
flutter build apk --release
```

## المميزات الرئيسية

- ✅ شاشة splash و onboarding احترافية
- ✅ شاشة تسجيل دخول وإنشاء حساب
- ✅ شاشة رئيسية مع SliverAppBar
- ✅ بطاقات الخدمات والأطباء
- ✅ شاشة الاستشارات
- ✅ شاشة الصيدلية مع منتجات
- ✅ شاشة الملف الشخصي مع إحصائيات
- ✅ Bottom Navigation Bar
- ✅ دعم الوضع المظلم/الفاتح
- ✅ أيقونات SVG احترافية
- ✅ ألوان متدرجة عصرية
- ✅ هيكلية Clean Architecture كاملة
- ✅ BLoC Pattern لإدارة الحالة
- ✅ قاعدة بيانات محلية
- ✅ Firebase Analytics & Crashlytics

## التكنولوجيا المستخدمة

- Flutter & Dart
- BLoC Pattern (flutter_bloc)
- Dio & Retrofit (HTTP Client)
- SQFlite (Local Database)
- Firebase (Auth, Analytics, Crashlytics)
- Google Fonts
- Flutter SVG

## المساهمة

نرحب بالمساهمات! يرجى اتباع هيكلية Clean Architecture عند إضافة ميزات جديدة.

## الترخيص

جميع الحقوق محفوظة - منصة صحتك الطبية.
