import 'package:flutter/material.dart';

import 'package:ittalentsproject/custom_drawer/drawer_user_controller.dart';
import 'package:ittalentsproject/custom_drawer/home_drawer.dart';
import 'package:ittalentsproject/screensAbout/company_details_animator.dart';
import 'package:ittalentsproject/vues/afficher_formations.dart';
import 'package:ittalentsproject/vues/home.dart';
import 'package:share/share.dart';
import 'package:ittalentsproject/variable.dart';

import 'ContactScreen.dart';
import 'PartenariatScreen.dart';



class NavigationHomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => _NavigationHomeScreenState() ;

}

class _NavigationHomeScreenState extends State<NavigationHomeScreen>
{
  void initState() {

    drawerIndex = DrawerIndex.HOME;
    screenView =HomePage(le_parent: 37
        ,default_image: 'https://media.istockphoto.com/photos/the-perfect-setting-to-complete-work-picture-id1251629816?b=1&k=20&m=1251629816&s=170667a&w=0&h=HFCKUXMAXu_gsKwAaVJ5Yfc5CpXhkok4Nu1KigsAXIQ=');


        super.initState();
  }
  Widget screenView;
  DrawerIndex drawerIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomePage(le_parent: 37
              ,default_image: 'https://media.istockphoto.com/photos/the-perfect-setting-to-complete-work-picture-id1251629816?b=1&k=20&m=1251629816&s=170667a&w=0&h=HFCKUXMAXu_gsKwAaVJ5Yfc5CpXhkok4Nu1KigsAXIQ=');
          // MaterialApp.router(routeInformationParser: green, routerDelegate: ContactScreen())
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = ContactScreen();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = CompanyDetailsAnimator();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = PartenariatScreen();
        });
      } else {
        if(drawerIndex == DrawerIndex.Share)
        {

          Share.share(" Assurez votre succès rejoignez nos formations à l'école de l'innovation et de l'expertise informatique IT TALENTS SCHOOL \n" );



        }
      }
    }
  }

}

