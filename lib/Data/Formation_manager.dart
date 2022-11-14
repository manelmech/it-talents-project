import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';






class Formation_manager
{
  Duration cacheValidDuration;
  DateTime lastFetchTime;
  Formation_manager()
  {

    cacheValidDuration = Duration(minutes: 10);
    lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);


  }
  Future<List> get_formation() async
  {
    lastFetchTime = DateTime.now();
    List<Formation> formations = [];
    var response = await http.get(
        Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/formation?per_page=100"));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);

    for(var u in jsonMap)
    {
      Formation formation = Formation.fromJson(u);
      formations.add(formation);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('formations', json.encode(jsonMap));
    return formations;
  }


  List<Formation> formationFromJson(String str) => List<Formation>.from(json.decode(str).map((x) => Formation.fromJson(x)));
  String formationToJson(List<Formation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Future<List> get_formationpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List form= json.decode( prefs.getString('formations'));
    List<Formation> formations = [];
    for(var u in form)
    {
      Formation formation = Formation.fromJson(u);
      formations.add(formation);
    }
    return formations;
    for(var u in form)
    {
      print(u.date);
    }
  }




/*************************************************************/
  static Future<List> get_formation_search(String query) async
  {
    if(query=="")
    {
      return null ;
    }
    else {
      List<Formation> formations = [];
   //   var response = await http.get(
     //     Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/formation"));
    //  var jsonString = response.body;
   //   var jsonMap = json.decode(jsonString);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List form= json.decode( prefs.getString('formations'));
      String titre ;
      for(var u in form)
      {
        query=query.toLowerCase() ;
        Formation formation = Formation.fromJson(u);
        titre = formation.title.rendered.toLowerCase() ;
        if(titre.contains(query)){
          formations.add(formation);
        }

      }

      return formations;
    }

  }


}