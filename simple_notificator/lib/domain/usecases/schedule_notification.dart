import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> scheduleNotification(int seconds) async {
  tz.initializeTimeZones();

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'canal_id',
    'Notificações Agendadas',
    channelDescription: 'Canal para notificações agendadas',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    1,
    'Notificação Agendada',
    'Esta notificação foi agendada para daqui a $seconds segundos.',
    tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
    notificationDetails,
    matchDateTimeComponents: null,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
