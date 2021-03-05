import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FCMInit {
  final firebaseMessaging = FirebaseMessaging();
  String token = '';

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
  void init() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint('onMessage: $message');
        getDataFcm(message);
      },
      onBackgroundMessage: onBackgroundMessage,
      onResume: (Map<String, dynamic> message) async {
        debugPrint('onResume: $message');
        getDataFcm(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        debugPrint('onLaunch: $message');
        getDataFcm(message);
      },
    );
    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true),
    );
    firebaseMessaging.onIosSettingsRegistered.listen((settings) {
      debugPrint('Settings registered: $settings');
    });
    // firebaseMessaging.getToken().then((token) => setState(() {
    //   this.token = token;
    // }));
    firebaseMessaging.getToken().then((token) {
      this.token = token;
    });
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