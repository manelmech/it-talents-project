import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Data/getAllData.dart';
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:ittalentsproject/vues/home.dart';
import 'package:ittalentsproject/data/category_manager.dart';


class afficher_formations extends StatefulWidget {

final String title;
final String image;
final int id;

afficher_formations(this.title,this.image,this.id);


  _afficher_formationsState createState() => _afficher_formationsState();
}
class _afficher_formationsState extends State<afficher_formations> {



   Formation_manager form =new Formation_manager();
  category_manager categ= new category_manager()  ;
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
                    image: CachedNetworkImageProvider( widget.image),

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
                      widget.title, textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30,),
                 FadeAnimation(1.3, Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                      ),
                      child: Container(),
                    )),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
                Container(
                  padding: EdgeInsets.only(
                    top:12.0,
                    left: 19,

                  ),
                  height: 100,

                  child: GestureDetector(
                    onTap: () {
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


            //__________________________________Formations_____________________________
            FadeAnimation(1.4,
              FutureBuilder(
                future: getAllData().getAllDataForm(form),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    print(snapshot.data.length);
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index)  {
                          Formation formation = snapshot.data[index];
                          /*return makeItem(widget.id,formation.image.guid,formation.title.rendered,formation.date,formation.rating,
                            formation.duration,formation.dateStatus[0], formation.profile, formation.image.postTitle,
                            formation.content.rendered,formation.link);*/

                      //await  choisir(widget.id);
                          int k=0;
                         for(int i in formation.catalogue ){

    if(i==widget.id) {
    k++;
    }
    }
                         if(k==0){ return new Container();}
                         else{
                          return Column(

                              children: [

                                  FadeAnimation(1.2,

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
                                          link: formation.link,
                                          programme: formation.programme)),
                                ]);}


                        }
                    );
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                },

              ),
            ),
            SizedBox(height: 80,),



            //__________________________________Formations_____________________________







          ],
        ),
      ),
    );
  }


}
