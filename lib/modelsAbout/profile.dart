import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Profile {
  final String titre1;
  final String titre2;
  final String titre3;
  final String president;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  final List<Course> courses;
  final List<Realisation> realisations;

  Profile({
    @required this.titre1,
    @required this.titre2,
    @required this.titre3,
    @required this.president,
    @required this.location,
    @required this.logo,
    @required this.backdropPhoto,
    @required this.about,
    @required this.courses,
    @required this.realisations,
  });
}
class info{
  final Icon icon;
  final String des;


  info( @required this.icon,
         @required this.des,
       );
}
class Course {
  final String title;
  final String thumbnail;


  Course({
    @required this.title,
    @required this.thumbnail,


  });


}
class Realisation
{
 final String icon;
final String number;
final String desc;

  Realisation(this.icon, this.number, this.desc);



}