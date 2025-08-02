abstract class NotificationService {
  Future<void> init();
  Future<void> showInstantNotification();
  Future<void> scheduleNotificationInSeconds(int seconds);
}
