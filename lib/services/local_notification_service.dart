//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  static final FlutterLocalNotificationsPlugin _notificationsPlugin= FlutterLocalNotificationsPlugin();




  static void initialize() {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings);

                            }

  static void initialized() {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@drawable/launch_background"));
    _notificationsPlugin.initialize(initializationSettings);

  }
  static void display(RemoteMessage message) async {
  //final styleInformation = BigPictureStyleInformation(largeIc);
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "ittalents",
            "ittalents channel",
            "this is our channel",
            importance: Importance.max,
            priority: Priority.high,
         //   largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
         //   styleInformation: MediaStyleInformation(),
            //sstyleInformation: styleInformation,
       // largeIcon : DrawableResourceAndroidBitmap("flutter_devs"),
          )
      );
      await _notificationsPlugin.show(
        id,
        message.notification.title,
        message.notification.title,
        notificationDetails,

      );
    } on Exception catch (e) {
      print(e);
    }

  }
}


/*class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String route) async{
      if(route != null){
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  static void display(RemoteMessage message) async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "easyapproach",
            "easyapproach channel",
            "this is our channel",
            importance: Importance.max,
            priority: Priority.high,
          )
      );


      await _notificationsPlugin.show(
        id,
        message.notification.title,
        message.notification.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}*/
