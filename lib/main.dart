import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/MyScreens/PartenariatForm.dart';
import 'package:ittalentsproject/services/local_notification_service.dart';
import 'package:ittalentsproject/vues/ReservationScreen.dart';
import 'package:ittalentsproject/vues/home.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:ittalentsproject/variable.dart' ;
import 'package:splashscreen/splashscreen.dart';

import 'MyScreens/NavigationHomeScreen.dart';

/*
void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationHomeScreen(),
        title:'IT TALENT SCHOOL'
    )
);*/
/// recive message when app, is in background solution for one message
Future<void> backgroundHandler(RemoteMessage message) async{
    print(message.data.toString());
    print(message.notification.title);
  //  variable.stezer();
int cptmain=variable.gtcpt();
   cptmain++;
 //   variable.inct();
   // int cptmain=variable.gtcpt();
    print("variable.cpt");
    print(cptmain);

  //  if(variable.isfavorite){FlutterAppBadger.removeBadge();variable.isfavorite=false;}
    FlutterAppBadger.updateBadgeCount(cptmain);
}
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    LocalNotificationService.initialize();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
 //   if(variable.isfavorite){FlutterAppBadger.removeBadge();variable.isfavorite=false;}
 //  FlutterAppBadger.removeBadge();
    runApp(MyApp());
    //  flutter_local_notifications: ^8.2.0  firebase_messaging: ^10.0.7
    //   flutter_local_notifications: ^1.4.4+2
    //   firebase_core: ^1.7.0
}


/*class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            debugShowCheckedModeBanner: false,

            home: NavigationHomeScreen(),
           // routes: {"green":(_) => NavigationHomeScreen()},
            title:'IT TALENT SCHOOL'
            );//le_parent: 37,

    }
} */
class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {

        return MaterialApp(
                         title:'IT TALENTS SCHOOL',
              debugShowCheckedModeBanner: false,
              home:
             SplashScreen(

              seconds: 6,
              navigateAfterSeconds: NavigationHomeScreen(),

              image: Image.asset("images/ITalentslogo.png",
             ),
              backgroundColor: Colors.white,
                  photoSize:      180.0,


          ) );
         ;
    }
}