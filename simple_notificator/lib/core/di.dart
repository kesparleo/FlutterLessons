import 'package:simple_notificator/app/notificatio_service.dart';
import 'package:get_it/get_it.dart';
import '../infrastructure/notification_service_impl.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final service = NotificationServiceImpl();
  await service.init();
  getIt.registerSingleton<NotificationService>(service);
}
