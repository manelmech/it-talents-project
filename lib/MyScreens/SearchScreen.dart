import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:ittalentsproject/vues/home.dart';
class SearchScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _SearchScreen() ;
}
class _SearchScreen extends State<SearchScreen>
{
   String query ;
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: Colors.grey[100],
     body: Column(
       children: [
         SizedBox(height:50.0),
        Container(
           padding: EdgeInsets.symmetric(vertical: 3),
           margin: EdgeInsets.symmetric(horizontal: 40),
           height: 50,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),
             color: Colors.white,
           ),
           child: TextField(
onChanged: (value){setState((){query = value;});},
             decoration: InputDecoration(
                 border: InputBorder.none,
                 prefixIcon: Icon(Icons.search, color: Colors.grey,),
                 hintStyle: TextStyle(
                     color: Colors.grey, fontSize: 15),
                 hintText: "Recherchez votre formation"
             ),
           ),
         ),
         SizedBox(height:20.0),
         Expanded(
           child: SingleChildScrollView
             (
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: FadeAnimation(1.4,
                  FutureBuilder(
                   future: Formation_manager.get_formation_search(query),
                   builder: (context, snapshot) {
                     if (snapshot.hasData) {
                       print(snapshot.data.length);
                       return ListView.builder(
                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: snapshot.data.length,
                           itemBuilder: (context, index) {
                             Formation formation = snapshot.data[index];

                             return Column(children: [FadeAnimation(1.2,
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
                                 programme:formation.programme)),
                             ]);
                           }
                       );
                     }
                     else {
                       return Container();
                     }
                   },

                 ),
               ),
             ),
           ),
         ),
       ],
     ),
   );

  }

}