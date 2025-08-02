import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_notificator/app/notificatio_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServiceImpl implements NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(initSettings);
  }

  @override
  Future<void> showInstantNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'instant_channel',
      'Notificações Instantâneas',
      importance: Importance.max,
      priority: Priority.high,
    );
    const generalDetails = NotificationDetails(android: androidDetails);
    await _plugin.show(0, 'Notificação', 'Mensagem imediata.', generalDetails);
  }

  @override
  Future<void> scheduleNotificationInSeconds(int seconds) async {
    const androidDetails = AndroidNotificationDetails(
      'scheduled_channel',
      'Notificações Agendadas',
      importance: Importance.max,
      priority: Priority.high,
    );
    const generalDetails = NotificationDetails(android: androidDetails);
    await _plugin.zonedSchedule(
      1,
      'Notificação Agendada',
      'Mensagem para mais tarde.',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      generalDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: null,
    );
  }
}
