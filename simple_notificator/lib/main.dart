import 'package:flutter/material.dart';
import 'core/di.dart';
import 'presentation/notification_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(); // Inicia tudo
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificações',
      home: const NotificationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialização do fuso horário para notificações agendadas
  tz.initializeTimeZones();

  await NotificationService().init();

  runApp(const MyApp());
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(initSettings);
  }

  Future<void> showInstantNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'instant_channel',
      'Notificações Instantâneas',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails generalDetails = NotificationDetails(android: androidDetails);

    await _plugin.show(
      0,
      'Notificação Instantânea',
      'Esta é uma notificação enviada de imediato.',
      generalDetails,
    );
  }

  Future<void> scheduleNotificationInSeconds(int seconds) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'scheduled_channel',
      'Notificações Agendadas',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails generalDetails = NotificationDetails(android: androidDetails);

        await _plugin.zonedSchedule(
      1,
      'Notificação Agendada',
      'Esta notificação foi agendada.',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      generalDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: null, // Desliga repetição
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificações',
      home: const NotificationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationService service = NotificationService();

    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Notificações')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => service.showInstantNotification(),
              child: const Text('Notificação Instantânea'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => service.scheduleNotificationInSeconds(10),
              child: const Text('Agendar para 10 segundos'),
            ),
          ],
        ),
      ),
    );
  }
}
*/