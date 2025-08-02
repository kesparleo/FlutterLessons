import 'package:flutter/material.dart';
import 'package:simple_notificator/app/notificatio_service.dart';
import 'package:simple_notificator/core/di.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = getIt<NotificationService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Notificações')),
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
              child: const Text('Agendar Notificação'),
            ),
          ],
        ),
      ),
    );
  }
}
