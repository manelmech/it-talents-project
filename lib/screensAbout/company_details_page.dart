import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/modelsAbout/profile.dart';
import '../components.dart';
import 'company_details_intro_animation.dart';


class CompanyDetailsPage extends StatelessWidget {

  final Profile profile;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage({
    @required this.profile,
    @required AnimationController controller
  })
      : animation = CompanyDetailsIntroAnimation(controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.black,
        ),
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(profile.backdropPhoto, fit: BoxFit.cover ,),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0),
          child: _buildContent(context),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: double.infinity, height: 50.0),
          Row(
            children: <Widget>[
              SizedBox(width: 30.0),
              _buildLogoAvatart(),
              SizedBox(width: 15.0),
              _buildUpperTitle()
            ],
          ),
          SizedBox(height: 50.0),
          _buildTitle(profile.titre1),
          SizedBox(height: 5.0,),
          _buildLocation(),
          _buildDivider(context),
          _buildAbout(),
          SizedBox(height: 40.0),
          _buildInfos(),
          SizedBox(height: 20.0),
          _buildTitle(profile.titre2),
          SizedBox(height: 20.0),
          _buildCourseListView(),
          SizedBox(height: 20.0),
          _buildTitle(profile.titre3),
          SizedBox(height: 20.0),
          _buildRealisationListView(),


        ],
      ),
    );
  }

  Widget _buildLogoAvatart() {
    return Transform.scale(
      scale: animation.avatarScale.value,
      child: CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage(profile.logo),
        backgroundColor: Colors.black.withOpacity(0.0),
      ),
    );
  }

  Widget _buildUpperTitle() {
    return Expanded(
      child: Text(profile.president, style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 23.0*animation.avatarScale.value),
      ),
    );
  }

  Widget _buildTitle(String titre) {
    return FadeTransition(
      opacity: animation.titleFade,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(titre, style: TextStyle(
          color: Colors.white,
          fontSize: 27.0,
          fontWeight: FontWeight.bold)
        )
      ),
    );
  }


  Widget _buildLocation() {
    return FadeTransition(
      opacity: animation.loactionFade,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(profile.location, style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 16.0)
        )
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width/1.6*animation.dividerWidth.value,
      height: 1.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    );
  }

  Widget _buildAbout() {
    return FadeTransition(
      opacity: animation.descriptionFade,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(profile.about, style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16.0,
          height: 1.5)
        )
      ),
    );
  }

  Widget _buildCourseListView() {
    return SlideTransition(
      position: animation.coursesSLide,
      child: Container(
        height: 180.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: profile.courses.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCourseCard(index);
          },
        )
      ),
    );
  }

  Widget _buildCourseCard(int index) {
    return Container(

      width: 170.0,
      margin: index == profile.courses.length-1 ?
        EdgeInsets.symmetric(horizontal: 20.0) :
        EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.all(6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            //fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(profile.courses[index].thumbnail,
                    fit: BoxFit.cover,
                    height:100.0,
                    width:double.infinity)
              ),
            /*  Align(
                heightFactor: 2.35,
                alignment: Alignment(0.8, 1.0),
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    radius: 24.0,
                    child: Icon(Icons.link),
                  ),
                  onTap: () { _launchURL(profile.courses[index].url); },
                ),
              ) */
            ],
          ),
          SizedBox(height: 10.0),
          Text(profile.courses[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(

            color: Colors.white.withOpacity(0.9),
            fontSize: 15.0,
            height: 1.5)
          ),
        ],
      ),
    );
  }
  Widget _buildInfos() {
    return FadeTransition(
      opacity: animation.descriptionFade,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column (children : [
            InkWell(
              child: Row(
                children:[
                  Icon(
                      Icons.phone,color: Colors.white.withOpacity(0.9),size:20.0

                  ),
                  SizedBox(width: 20.0,),
                  Text(
                    "+213 (0) 23 78 10 28",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16.0,
                        height: 1.5)
                    ,),

                ]

          ),
            onTap: (){makingPhoneCall();}
            ),
            SizedBox(height:5.0),
            InkWell(
              onTap: ()
              {
                launchEmail();
              },
              child: Row(
                  children:[
                    Icon(
                        Icons.mail,color: Colors.white.withOpacity(0.9),size:20.0

                    ),
                    SizedBox(width: 20.0,),
                    Text(
                      "contact@ittalents.dz",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16.0,
                          height: 1.5)
                      ,),

                  ]

              ),
            ),
            SizedBox(height:5.0),
            Row(
                children:[
                  Icon(
                      Icons.watch_later,color: Colors.white.withOpacity(0.9),size:20.0

                  ),
                  SizedBox(width: 20.0,),
                  Text(
                    "Dim – Jeu 9:00 – 17:00",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16.0,
                        height: 1.5)
                    ,),

                ]

            ),

          ]),

      ),
    );
  }


  Widget _buildRealisationCard(int index) {
    return Container(

      width:115.0,
      margin: index == profile.realisations.length-1 ?
      EdgeInsets.symmetric(horizontal: 20.0) :
      EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.all(6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


                  Container(child: ImageIcon( AssetImage(profile.realisations[index].icon,) ,size:50.0,color: Colors.white.withOpacity(0.9),),),




              /*  Align(
                heightFactor: 2.35,
                alignment: Alignment(0.8, 1.0),
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    radius: 24.0,
                    child: Icon(Icons.link),
                  ),
                  onTap: () { _launchURL(profile.courses[index].url); },
                ),
              ) */


          SizedBox(height: 10.0),
          Text(profile.realisations[index].number,
              textAlign: TextAlign.center,
              style: TextStyle(

                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15.0,
                  height: 1.5)
          ),
          Text(profile.realisations[index].desc,
              textAlign: TextAlign.center,
              style: TextStyle(

                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15.0,
                  height: 1.5)
          ),
        ],
      ),
    );
  }

  Widget _buildRealisationListView() {
    return SlideTransition(
      position: animation.coursesSLide,
      child: Container(
          height: 160.0,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: profile.realisations.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildRealisationCard(index);
            },
          )
      ),
    );
  }
}

