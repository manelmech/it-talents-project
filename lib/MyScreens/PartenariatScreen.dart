import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



import 'PartenariatForm.dart';

class PartenariatModel {
  final String image;
  final String title;
  final String body;

  PartenariatModel({
    @required this.title,
    @required this.image,
    @required this.body,
  });
}

class PartenariatScreen extends StatefulWidget {
  @override
  _PartenariatScreenState createState() => _PartenariatScreenState();
}

class _PartenariatScreenState extends State<PartenariatScreen> {
  var boardController = PageController();

  List<PartenariatModel> boarding = [
    PartenariatModel(
      image: 'images/palaoto.jpg',
      title: 'PALOATO',
      body: 'Palo Alto Networks, le leader mondial de la cybersécurité , est une société multinationale américaine de cybersécurité dont le siège est situé à Santa Clara, en Californie,L''entreprise est au service de plus de 70 000 organisations dans plus de 150 pays',
    ),
    PartenariatModel(
      image: 'images/palaoto.jpg',
      title: 'PALAOTO',
      body: 'Palo Alto Networks, le leader mondial de la cybersécurité , est une société multinationale américaine de cybersécurité dont le siège est situé à Santa Clara, en Californie,L''entreprise est au service de plus de 70 000 organisations dans plus de 150 pays',
    ),

  ];

  bool isLast = false;

  void submit() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {

                    });
                  } else {
                    setState(() {

                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildPartenariatItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),

            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    expansionFactor: 2,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height:50.0),

            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60)),
              child: ElevatedButton(
                style:ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)
                      )
                  ),
                ),





                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PartenariatForm()),
                  );
                },
                child: Text(
                  'Devenir Partenaire',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPartenariatItem(PartenariatModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  SizedBox(height:60.0),
      FadeAnimation(1,
         Image(
          image: AssetImage('${model.image}'),

        ),
      ),
      SizedBox(height:30.0),
      FadeAnimation(1,
         Text(
          '${model.title}',
         style:  TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.grey[800],
               fontSize: 20),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
     FadeAnimation(1,
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ],
  );
}
