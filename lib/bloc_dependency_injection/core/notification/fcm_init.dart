import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification.dart';

class FCMInit {
  final firebaseMessaging = FirebaseMessaging();
  static String token = '';
  final localNotification = LocalNotification();


  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) {
    debugPrint('onBackgroundMessage: $message');
    if (message.containsKey('data')) {
      String name = '';
      String age = '';
      if (Platform.isIOS) {
        name = message['name'];
        age = message['age'];
      } else if (Platform.isAndroid) {
        var data = message['data'];
        name = data['name'];
        age = data['age'];
      }
      // dataName = name;
      // dataAge = age;
      debugPrint('onBackgroundMessage: name: $name & age: $age');
    }
    return null;
  }
  Future<void> init() async {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint('onMessage: $message');
        await localNotification.notificationHandler();
          LocalNotification.showNotification(message);
        },
        onBackgroundMessage: onBackgroundMessage,
        onLaunch: (Map<String, dynamic> message) async {
          debugPrint('onLaunch: $message');
          await localNotification.notificationHandler();
          LocalNotification.showNotification(message);
        },

        onResume: (Map<String, dynamic> message) async {
          debugPrint('onResume: $message');
          await localNotification.notificationHandler();
          LocalNotification.showNotification(message);
        }
    );
    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true),
    );
    firebaseMessaging.onIosSettingsRegistered.listen((settings) {
      debugPrint('Settings registered: $settings');
    });
    token = await firebaseMessaging.getToken();
    debugPrint('device token:$token');
  }

  void getDataFcm(Map<String, dynamic> message) {
    String name = '';
    String age = '';
    if (Platform.isIOS) {
      name = message['name'];
      age = message['age'];
    } else if (Platform.isAndroid) {
      var data = message['data'];
      name = data['name'];
      age = data['age'];
    }
    // if (name.isNotEmpty && age.isNotEmpty) {
    //   setState(() {
    //     dataName = name;
    //     dataAge = age;
    //   });
    // }
    debugPrint('getDataFcm: name: $name & age: $age');
  }
}