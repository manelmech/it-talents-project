import 'dart:convert';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:ittalentsproject/Data/category_manager.dart';
import 'package:ittalentsproject/Data/getAllData.dart';


import 'package:http/http.dart' as http;
import 'package:ittalentsproject/vues/afficher_formations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class afficher_catalogues extends StatefulWidget {
  final  int le_parent;
  final String image_cat;


  const afficher_catalogues({Key key, this.le_parent,this.image_cat}) : super(key: key);

  @override
  _afficher_cataloguesState createState() => _afficher_cataloguesState();
}
class _afficher_cataloguesState extends State<afficher_catalogues> {

  int g =0;
  bool _isButtonDisabled=true;
  category_manager categ =new category_manager();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Stack(
        children:[

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

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Container(),
                    )),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),Container(
            padding: EdgeInsets.only(
              left: 19,
              top:12,

            ),
            height: 100,

            child: GestureDetector(
              onTap: () {
                _isButtonDisabled=true;
                Navigator.pop(context);
              },
              child: Container(

                child: Icon(
                  Icons.arrow_back,

                  color: Colors.black,
                  size: 24,

                ),

              ),
            ),
          ), ],),
            SizedBox(height: 30,),


            //__________________________________categories_____________________________





            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Catégories", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, Container(
                    height: 600,
                    child: FutureBuilder (

                      future: getAllData().getAllDataCateg(categ),
                      builder: (context,snapshot) {


                        if(snapshot.hasData)  {

                          return  ListView.builder  (
                            shrinkWrap: true,
                            physics:NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,

                            itemBuilder:(context,index) {
                              Map map = snapshot.data[index];


                              if( map["parent"]==widget.le_parent ) {

                                if( map["image"].runtimeType == bool )  {

                                  choisir(map["id"]);


                                  return makeItem (

                                  image:   'https://media.istockphoto.com/photos/the-perfect-setting-to-complete-work-picture-id1251629816?b=1&k=20&m=1251629816&s=170667a&w=0&h=HFCKUXMAXu_gsKwAaVJ5Yfc5CpXhkok4Nu1KigsAXIQ=',

                                      title: map["name"], parent: map["id"],choix:this.g
                                  );
                                }
                                else{
                                  choisir(map["id"]);

                                  return  makeItem(
                                      image: map["image"]["guid"],
                                      title: map["name"], parent: map["id"],choix:this.g

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




                ],
              ),
            )



            //__________________________________categories_____________________________







          ],
        ),
      ),
    );
  }

  Widget makeItem ({image, title,parent,choix})  {

    return GestureDetector (

      onTap:  ()  async {
       if(this._isButtonDisabled== true){
         this._isButtonDisabled=false;
        await choisir(parent);
       // print("g make item");
        if( this.g== 0){

          Navigator.push(

              context,

              MaterialPageRoute(

                  builder: (context) =>  afficher_catalogues(le_parent:parent,image_cat: image,

                  )));this._isButtonDisabled=true;}
        else{
          Navigator.push(
              context,

              MaterialPageRoute(

                  builder: (context) =>afficher_formations( title,image,parent

                  )));};this._isButtonDisabled=true;}
      },
      child: AspectRatio(

        aspectRatio: 2 / 1,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(image),
                //  image: NetworkImage(image),
                  //       image: AssetImage(image),
                  //child:Image.network(image,
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
    }}

  Future<int>  choisir(int id) async {
    int cpt=0;
    var jsonMap;

    if (await isInternet()){
      var response =await http.get(Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/catalogue?per_page=100") );
      var jsonString =response.body;
      jsonMap =json.decode(jsonString);
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      prefs2.setString('categorieschoisir', json.encode(jsonMap));

    }
    else{
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      jsonMap= json.decode( prefs2.getString('categorieschoisir'));

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



}