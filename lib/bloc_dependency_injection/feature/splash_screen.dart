import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp/bloc_dependency_injection/core/notification/fcm_init.dart';
import 'package:movieapp/bloc_dependency_injection/core/notification/local_notification.dart';
import 'package:movieapp/bloc_dependency_injection/core/routing/routing.dart' as r;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // final firebaseMessaging = FirebaseMessaging();
  // String token = '';
  // final localNotification = LocalNotification();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  navigateDelay(String page) async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, () {
      // Navigator.of(context).pushReplacementNamed(page);
      Get.offAllNamed(page);
    });
  }

  // static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) async {
  
  //   debugPrint('onBackgroundMessage: $message');
  //   // 0
  //   return LocalNotification.showNotification(message);
  // }

  @override
  void initState() {
    FCMInit fcmInit = FCMInit();
    fcmInit.init().then((value) => navigateDelay(r.Routing.HOME));
    

    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     debugPrint('onMessage: $message');
    //     await localNotification.notificationHandler(context);
    //       LocalNotification.showNotification(message);
    //     },
    //     onBackgroundMessage: onBackgroundMessage,
    //     onLaunch: (Map<String, dynamic> message) async {
    //       debugPrint('onLaunch: $message');
    //       await localNotification.notificationHandler(context);
    //       LocalNotification.showNotification(message);
    //     },

    //     onResume: (Map<String, dynamic> message) async {
    //       debugPrint('onResume: $message');
    //       await localNotification.notificationHandler(context);
    //       LocalNotification.showNotification(message);
    //     }
    // );
    // firebaseMessaging.requestNotificationPermissions(
    //   const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true),
    // );
    // firebaseMessaging.onIosSettingsRegistered.listen((settings) {
    //   debugPrint('Settings registered: $settings');
    // });
    // firebaseMessaging.getToken().then((token) {
    //   this.token = token;
      
    // });

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.blueGrey,
      body: Container(
        child: Stack(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   child: Opacity(
            //       opacity: 0.6,
            //       child: Icon(Icons.movie)),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.movie, size: MediaQuery.of(context).size.width * 60 / 100,)
                  // Image(
                  //     image: AssetImage(MyImages.mainLogo1),
                  //     width: MediaQuery.of(context).size.width * 60 / 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}