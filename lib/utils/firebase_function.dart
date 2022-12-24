import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FirebaseFunction {
  static Logger log = Logger();
  static FlutterSecureStorage storage = const FlutterSecureStorage();
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    sound: RawResourceAndroidNotificationSound('notif'),
  );
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // ignore: long-method
  static Future<void> settingFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      const AndroidInitializationSettings('launcher_notification');
      final RemoteNotification? notification = message.notification;
      Logger().e(message.data.toString());
      final String? title = message.data['title'] as String?;
      final String? body = message.data['body'] as String?;
      final String? img = message.data['image'] as String?;
      if ((title ?? "") != "" && (body ?? "") != "" && (img ?? "") != "") {
        final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
          await _getByteArrayFromUrl(img ?? ""),
        );

        final BigPictureStyleInformation bigPictureStyleInformation =
            BigPictureStyleInformation(
          bigPicture,
          contentTitle: title,
          htmlFormatContentTitle: true,
          summaryText: body,
        );
        final AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          styleInformation: bigPictureStyleInformation,
          sound: const RawResourceAndroidNotificationSound('notif'),
          icon: 'launcher_notification',
        );
        final NotificationDetails notificationDetails =
            NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          title,
          body,
          notificationDetails,
        );
      } else if ((title ?? "") != "" && (body ?? "") != "") {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              sound: const RawResourceAndroidNotificationSound('notif'),
              icon: 'launcher_notification',
            ),
          ),
        );
      }
    });
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await FirebaseMessaging.instance.subscribeToTopic('global');
  }

  static Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  // ignore: long-method
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    const AndroidInitializationSettings('launcher_notification');
    final RemoteNotification? notification = message.notification;
    Logger().e(message.data.toString());
    final String? title = message.data['title'] as String?;
    final String? body = message.data['body'] as String?;
    final String? img = message.data['image'] as String?;
    if ((title ?? "") != "" && (body ?? "") != "" && (img ?? "") != "") {
      final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
        await _getByteArrayFromUrl(img ?? ""),
      );

      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(
        bigPicture,
        contentTitle: title,
        htmlFormatContentTitle: true,
        summaryText: body,
      );
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        styleInformation: bigPictureStyleInformation,
        sound: const RawResourceAndroidNotificationSound('notif'),
        icon: 'launcher_notification',
      );
      final NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        title,
        body,
        notificationDetails,
      );
    } else if ((title ?? "") != "" && (body ?? "") != "") {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            sound: const RawResourceAndroidNotificationSound('notif'),
            icon: 'launcher_notification',
          ),
        ),
      );
    }
  }
}
