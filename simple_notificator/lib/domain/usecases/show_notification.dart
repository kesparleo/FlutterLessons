import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showNotification() async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'canal_id',
    'Notificações Simples',
    channelDescription: 'Este canal é usado para notificações simples',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails generalNotificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'Notificação Imediata',
    'Esta é uma notificação exibida imediatamente.',
    generalNotificationDetails,
  );
}
