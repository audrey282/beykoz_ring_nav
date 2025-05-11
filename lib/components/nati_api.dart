import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart'; // for debugPrint

class NotificationAPI {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(initSettings);

    const androidNotificationChannel = AndroidNotificationChannel(
      'main_channel_id',
      'Main Notifications',
      description: 'This channel is used for basic app notifications',
      importance: Importance.high,
    );

    await _notifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      debugPrint('🔒 Notification permission not granted, requesting...');
      final requestResult = await Permission.notification.request();
      if (!requestResult.isGranted) {
        debugPrint('🚫 User denied notification permission');
        return;
      }
    }

    const androidDetails = AndroidNotificationDetails(
      'main_channel_id',
      'Main Notifications',
      channelDescription: 'This channel is used for basic app notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
    );
  }
}
