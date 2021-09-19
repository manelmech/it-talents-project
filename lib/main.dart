import 'package:day11/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://mdfive.dz/ecole/wp-content/uploads/2020/12/background-scaled.jpg'),
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
                      "Révélez vos competences", textAlign: TextAlign.center,
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
                        color: Colors.white,
                      ),
                      child: TextField(
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
                  FadeAnimation(1, Text("Catégories", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, Container(
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
                  )),

                  SizedBox(height: 20,),
                  FadeAnimation(1, Text("Best Hotels", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/united-states.jpg',
                            title: 'Canada'),
                        makeItem(
                            image: 'assets/images/greece.jpg', title: 'Italy'),
                        makeItem(
                            image: 'assets/images/Italy.jpg', title: 'Greece'),
                        makeItem(image: 'assets/images/canada.jpg',
                            title: 'United States')
                      ],
                    ),
                  )),
                  SizedBox(height: 80,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget makeItem({image, title}) {
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
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ),
      ),
    );


    /*class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;
  CountryListTile(
  {@required this.title,
  @required this.date,
  @required this.time,
  @required this.rating,
  @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
  return Container(
  margin: EdgeInsets.only(right: 8),
  child: Stack(
  children: [
  ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Container(
  child: CachedNetworkImage(
  image: imgUrl,
  height: 220,
  width: 150,
  fit: BoxFit.cover,
  ),)
  ),
  Container(
  height: 200,
  width: 150,
  child: Column(
  children: [
  Row(
  children: [
  Container(
  margin: EdgeInsets.only(left: 8, top: 8),
  padding:
  EdgeInsets.symmetric(vertical: 6, horizontal: 8),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  color: Colors.white38),
  child: Text(
  label ?? "New",
  style: TextStyle(color: Colors.white),
  ))
  ],
  ),
  Spacer(),
  Row(
  children: [
  Container(
  margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Container(
  child: Text(
  "Thailand",
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 16),
  ),
  ),
  SizedBox(
  height: 3,
  ),
  Text(
  "18 Tours",
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 13),
  )
  ],
  ),
  ),
  Spacer(),
  Container(
  margin: EdgeInsets.only(bottom: 10, right: 8),
  padding:
  EdgeInsets.symmetric(horizontal: 3, vertical: 7),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(3),
  color: Colors.white38),
  child: Column(
  children: [
  Text(
  "4.5",
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 13),
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
  )
  ],
  ),
  )
  ],
  ),
  );
  }
  }*/

  }
}
