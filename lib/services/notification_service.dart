import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
    const InitializationSettings settings = InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _notifications.initialize(settings);
  }

  Future<void> showNotification(String title, String body, {int? id}) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'medical_channel',
      'إشعارات صحتك',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notifications.show(id ?? DateTime.now().millisecond, title, body, details);
  }

  Future<void> scheduleAppointmentReminder(DateTime time, String doctorName) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'appointment_channel',
      'تذكير المواعيد',
      importance: Importance.high,
    );
    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notifications.schedule(
      time.millisecond,
      'تذكير بموعد طبي',
      'لديك موعد مع د. $doctorName بعد ساعة',
      time,
      details,
    );
  }
}
