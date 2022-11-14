import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class category_manager
{
  Duration cacheValidDuration;
  DateTime lastFetchTime;

  category_manager()
  {

    cacheValidDuration = Duration(minutes: 10);
    lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);


  }


  Future<List> get_category() async
  {

    var response =await http.get(Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/catalogue?per_page=100") );
    var jsonString =response.body;
    var jsonMap =json.decode(jsonString);
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setString('categories', json.encode(jsonMap));

    return jsonMap;

  }

  Future<List> get_categorypref() async {

    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    List categ= json.decode( prefs1.getString('categories'));

    return categ;

  }






}