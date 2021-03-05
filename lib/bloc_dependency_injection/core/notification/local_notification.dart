import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart' as r;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class LocalNotification {
  static Future<void> showNotification(dynamic payload) async {
    try {
      Map<String, dynamic> myMap = new Map<String, dynamic>.from(payload);
      final dynamic data = myMap['data'];
      final dynamic notification = myMap['notification'];
      const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
              'BBD', 'Notification', 'All Notification is Here',
              importance: Importance.max,
              priority: Priority.high);
      final int idNotification = data['id'] != null ? int.parse(data['id']) : 1;
      const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
              idNotification, notification['title'], notification['body'], platformChannelSpecifics,
              payload: "Isinya");
    } catch (e) {
      print(e);
    }
  }

  Future<void> notificationHandler() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          if (payload != null) {
            // Navigator.pushNamed(context, Routing.FAVOURITE_MOVIE);
            Get.toNamed(r.Routing.FAVOURITE_MOVIE);
          }
        });
  }
}