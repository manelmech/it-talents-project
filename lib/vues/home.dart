import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Data/category_manager.dart';
import 'package:ittalentsproject/Data/getAllData.dart';
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ittalentsproject/MyScreens/SearchScreen.dart';
import 'package:http/http.dart' as http;
import 'package:ittalentsproject/services/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ListformationScreen.dart';
import 'afficher_catalogues.dart';
import 'afficher_formations.dart';
import 'Details_formation.dart';
import 'package:ittalentsproject/variable.dart';
//import 'package:icon_badge/icon_badge.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:ittalentsproject/Data/getAllData.dart';
import 'package:ittalentsproject/variable.dart';

class HomePage extends StatefulWidget {
  final  int le_parent;
  final  String default_image;


  const HomePage({Key key, this.le_parent,this.default_image}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool connection = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  @override
  void initState() {
    //TODO : implement initState
    super.initState();
    initConnectivity();
  _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    /// gives you the message on witch user taps
    /// and it opened the app from terminated state
FirebaseMessaging.instance.getInitialMessage().then((message){
  if(message!= null) {

    //final routeFromMessage = message.data["route"];
   // FlutterAppBadger.updateBadgeCount(2);
  }

  //LocalNotificationService.display(message);

}); // FlutterAppBadger.updateBadgeCount(1);
    ///forground
     FirebaseMessaging.onMessage.listen((message){
       if(message.notification != null) {
        // FlutterAppBadger.updateBadgeCount(1);
         print(message.notification.body);
         print(message.notification.title);

       }
     //  FlutterAppBadger.updateBadgeCount(1);

       LocalNotificationService.display(message);
     //  variable.stezer();
       // here badger
      // FlutterAppBadger.updateBadgeCount(1);
       setState(() {

       });

     });
    ///When the app is in background but opened and user taps
    ///on the notification

    FirebaseMessaging.onMessageOpenedApp.listen((message){
    variable.cpt=0;
     // variable.zer();
     // print("variable.cpt home haut");
      FlutterAppBadger.removeBadge();
    //  variable.cpt--;
      variable.stezer();
      print("variable.cpt home");
      print(variable.cpt);
      variable.isfavorite = true;
     // final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed("ContactScreen()");
    //  variable.cpt=0;

      /*setState(() {
        variable.zer();
      });*/
      FlutterAppBadger.removeBadge();
     // LocalNotificationService.display(message);



    });

  }
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:

        if(this.connection){
          this.connection = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Vous êtes connectés'),
              backgroundColor: Colors.green,

            ),
          );}
        // return SnackBar(content:  const Text('Yay! A SnackBar!'),);
        break;

      case ConnectivityResult.mobile:

        if(this.connection){
          this.connection = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Vous êtes connectés'),
              backgroundColor: Colors.green,

            ),
          );} break;
      case ConnectivityResult.none:

        this.connection =true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Aucune connexion Internet'),

          ),
        ); break;
        //  setState(() => _connectionStatus = result.toString());


        break;
      default:
      //  setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
  int g =0;
  bool _isButtonDisabled=true;
  Formation_manager form= new Formation_manager() ;
  category_manager cat = new category_manager();
 String cptt = (variable.cpt).toString();

  @override
  Widget build(BuildContext context) {
    variable.zer();
    return Scaffold(
      /*appBar: AppBar(actions: <Widget>[IconBadge(
        icon: Icon(Icons.notifications_none),
        itemCount: 100,
        badgeColor: Colors.red,
        itemColor: Colors.white,
        maxCount: 99,
        hideZero: true,
        onTap: () {
          print('test');
        },
      ),]),*/

      backgroundColor: Colors.grey[100],

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[

        /* new RaisedButton(
              child: new Text( cptt),

              onPressed: () {
                _addBadge();
              },

         ),
*/


            Container(

              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                    'images/teams.jpg'   ),
                    fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2),
                        ]
                    )
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1, Text(
                      "Success, Nothing Less", textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30,),
                    FadeAnimation(1.3, Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        readOnly: true,
                        onTap:() {
                          Navigator.push(
                              context,

                              MaterialPageRoute(

                                  builder: (context) =>SearchScreen())) ;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 15),
                            hintText: "Recherchez votre formation"
                        ),
                      ),
                    )),


                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Catégories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4,
                     /* Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(
                            image: 'assets/images/canada.jpg', title: 'Canada'),
                        makeItem(
                            image: 'assets/images/Italy.jpg', title: 'Italy'),
                        makeItem(
                            image: 'assets/images/greece.jpg', title: 'Greece'),
                        makeItem(image: 'assets/images/united-states.jpg',
                            title: 'United States')
                      ],
                    ),
                  )*/
                      Container(
                        height: 200,
                        child: FutureBuilder (

                          future: getAllData().getAllDataCateg(cat),
                          builder: (context,snapshot) {

                            if(snapshot.hasData)  {

                              return  ListView.builder  (
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,

                                itemBuilder:(context,index) {
                                  Map map = snapshot.data[index];

                                  if( map["parent"]==widget.le_parent ) {

                                    if( map["image"].runtimeType == bool )  {
                                      //  choisir(map["id"]);

                                      return makeItem (
                                          image:

                                          widget.default_image,
                                          title: map["name"], parent: map["id"]
                                      );
                                    }
                                    else{
                                      // choisir(map["id"]);
                                      return  makeItem(
                                          image: map["image"]["guid"],
                                          title: map["name"], parent: map["id"]
                                      );
                                    }
                                  }
                                  else{

                                    return new Container();

                                  }
                                },
                              );
                            }
                            else{

                              return Center(child:CircularProgressIndicator());

                            }
                          },

                        ),
                      )
                  ),

                  SizedBox(height: 30,),
                  FadeAnimation(1, Text("Nos formations", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  // SizedBox(height: 1,),
                  FadeAnimation(1.4,
                    FutureBuilder(
                      future:  getAllData().getAllDataForm(form),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List formations=  snapshot.data;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: formations.length,
                              itemBuilder: (context, index) {


                                Formation formation = formations[index];
                                String rating =(formation.rating.toString()  != "[]" ) ? formation.rating.toString() :0.toString();
                                if( double.parse(rating) > 3.toDouble() )
                                {return Column(children: [ FadeAnimation(1.2,
                                    Formationlist_screen(
                                        imgUrl: formation.image.guid,
                                        title: formation.title.rendered,
                                        date: formation.date,
                                        rating: formation.rating,
                                        duration: formation.duration,
                                        confirmed: formation.dateStatus[0],
                                        formateur: formation.profile,
                                        partenaire: formation.image.postTitle,
                                        content: formation.content.rendered,
                                        link:formation.link,
                                    programme: formation.programme,)),
                                ]);}else{ return new Container();} }
                          );
                        }
                        else {

                          return Center(child: CircularProgressIndicator());

                        }
                      },

                    ),

                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,MaterialPageRoute(

                          builder: (context) =>  ListformationScreen() ));
                    },
                    child: Container(

                        padding: EdgeInsets.all(4.0),
                        child:Text(".. Afficher plus ..",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        margin: EdgeInsets.only(left:20.0,right:20.0),
                        height: 35,
                        width: 400,
                      /*  decoration:BoxDecoration(
                            color:Colors.grey[100],
                            border: Border.all(
                              //  color:Color(0xff139157),
                                width:2.0))*/),
                  ),
                SizedBox(height: 60,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
    /*Widget makeItem({image, title}) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title, style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          ),
        ),
      );
    }*/
  Widget makeItem ({image, title,parent})  {

    return GestureDetector (
      onTap: ()   async { if(this._isButtonDisabled== true){
        this._isButtonDisabled=false;
        variable.stezer();

        await choisir(parent);

        if( this.g== 0){
          Navigator.push(
              context,

              MaterialPageRoute(

                  builder: (context) =>  afficher_catalogues(le_parent:parent,image_cat: image

                  )));this._isButtonDisabled=true;}
        else{
          Navigator.push(
              context,

              MaterialPageRoute(

                  builder: (context) =>afficher_formations( title,image,parent

                  )));}this._isButtonDisabled=true;}
      },
      child: AspectRatio(

        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                 // image: NetworkImage(image),
                  image: CachedNetworkImageProvider(image),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title, style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        return true;
      } else {
        // Wifi detected but no internet connection found.
        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
  Future<int>  choisir(int id) async {
    int cpt=0;
    var jsonMap;

    if (await isInternet()){
      var response =await http.get(Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/catalogue?per_page=100") );
      var jsonString =response.body;
      jsonMap =json.decode(jsonString);
      SharedPreferences prefs3 = await SharedPreferences.getInstance();
      prefs3.setString('categorieschoisir1', json.encode(jsonMap));

    }
    else{
      SharedPreferences prefs3 = await SharedPreferences.getInstance();
      jsonMap= json.decode( prefs3.getString('categorieschoisir1'));

    }

    for(var u in jsonMap){

      if(  u["parent"]== id ){
        cpt++;
      }
    }


    if(cpt==0){


      this.g=1;

      return 0;}
    else{

      this.g=0;


      return 1;}


  }




  void _addBadge() {
    FlutterAppBadger.updateBadgeCount(1);
  }

  }



class Formationlist_screen extends StatelessWidget {
  final String imgUrl;
  final String title;
  final DateTime date;
  final dynamic rating;
  final dynamic duration;
  final String confirmed;
  final String partenaire;
  final String content;
  final String formateur;
  final String link;
  final String programme;

  Formationlist_screen(
      { @required this.imgUrl,
        @required this.title,
        @required this.date,
        @required this.rating,
        @required this.duration,
        @required this.confirmed,
        @required this.partenaire,
        @required this.content,
        @required this.formateur,
        @required this.link,
        @required this.programme
       }     );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FadeAnimation(1, Details_formation(
                rating: rating,
                imgUrl: imgUrl,
                title: title,
                date: date,
                confirmed: confirmed,
                duration: duration,
                partenaire: partenaire,
                content: content,
                formateur: formateur,
                link:link,
                programme:programme))));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
           
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
                 child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                     child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Container(
                            padding: const EdgeInsets.only(bottom:8),
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4E6059)),
                            ),
                          ),

                        SizedBox(
                          height: 5,
                        ),

                           Row(
                             children: [Icon(
                               Icons.calendar_today_sharp,
                               color: Colors.blue[500],
                               size: 20,
                             )
                               ,
                               SizedBox(
                                 width: 5,
                               ),

                               Text(
                              date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4E6059)),
                          ),
                           ],),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [Icon(
                            Icons.watch_later_outlined,
                            color: Colors.blue[500],
                            size: 20,
                          )
                            ,
                            SizedBox(
                              width: 5,
                            ),

                            Text(
                              duration.toString()+"jours",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4E6059)),
                            ),
                          ],),
                      ],
                    ),

              ),
               ),
           // ),
            Container(
                margin: EdgeInsets.only(bottom: 10, right: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue[500]),
                child: Column(

                  children: [
                    Text(
                     ("$rating" != "[]" ) ? "$rating":0.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}



