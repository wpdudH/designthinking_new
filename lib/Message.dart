import "package:flutter/material.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> Notificate() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initAndroidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initIosSetting = IOSInitializationSettings();
  var initSetting = InitializationSettings(android: initAndroidSetting);
  await FlutterLocalNotificationsPlugin().initialize(initSetting);
}

Future<void> showNotification(String title, String body) async {
  var android = AndroidNotificationDetails(
    'chnnelId', 'channelName', 'channelDescription');
  var platform = NotificationDetails(android: android);

  await FlutterLocalNotificationsPlugin().show(0, title, body, platform);
}

