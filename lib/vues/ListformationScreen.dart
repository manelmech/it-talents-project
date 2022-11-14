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
import 'Details_formation.dart';
import 'package:http/http.dart' as http;


class ListformationScreen extends StatefulWidget {


  ListformationScreen();


  _ListformationScreenState createState() => _ListformationScreenState();
}


class _ListformationScreenState extends State<ListformationScreen> {



  category_manager categ= new category_manager()  ;
  Formation_manager form= new Formation_manager()  ;

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
                        image: CachedNetworkImageProvider("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQk0encErjlb-pVViO3AjEYy9Lh2fTa8Y0Q&usq"),

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
                          "Nos fomations", textAlign: TextAlign.center,
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
                          child: Container(

                          ),
                        )),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 14,

                  ),
                  height: 100,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
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
                                          programme :formation.programme)),
                                ]);


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

/************************************************************/
  /*final _baseUrl = "https://mdfive.dz/ecole/wp-json/wp/v2/formation";

  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int _limit = 10;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];
  List _formations =[];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
      await http.get(Uri.parse("$_baseUrl?page=$_page&per_page=$_limit"));
      setState(() {

        _posts = json.decode(res.body);

        for(var u in _posts)
        {
          Formation formation = Formation.fromJson(u);
          print(2);
          _formations.add(formation);
          print( _formations.length);
          print("hello");

        }
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.pixels >=
    _controller.position.maxScrollExtent )

         {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res =
        await http.get(Uri.parse("$_baseUrl?page=$_page&per_page=$_limit"));
         List fetchedPosts;
        fetchedPosts.clear();
        fetchedPosts = json.decode(res.body);
        if (fetchedPosts.length > 0) {
          setState(() {

            for(var u in fetchedPosts)
            {
              Formation formation = Formation.fromJson(u);
              _formations.add(formation);
            }
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
   ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);

  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }
/***********************************************************/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],
      body:
      _isFirstLoadRunning
          ? Center(
        child: CircularProgressIndicator(),
      ):
            //__________________________________Formations_____________________________//
         Column(children:
            [Stack(
            children:[

            Container(
            height: 300,
           decoration: BoxDecoration(
             image: DecorationImage(
                 image: NetworkImage( "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQk0encErjlb-pVViO3AjEYy9Lh2fTa8Y0Q&usq"),
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
                   " Nos formations ", textAlign: TextAlign.center,
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
                   child: TextField(

                   ),
                 )),
                 SizedBox(height: 30,)
               ],
             ),
           ),
         ),
      Container(
        padding: EdgeInsets.only(
          left: 14,

        ),
        height: 100,

        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 34,

            ),
          ),
        ),
      ), ],),
              Expanded(child:FadeAnimation(1.4,

                ListView.builder(
                          itemCount: _formations.length,
                          controller: _controller,
                          itemBuilder: (_, index)  {

                            /*if(index == 0)
                            {
                              return Stack(
                                children:[

                                  Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage( "https://www.webmarketing-com.com/wp-content/uploads/2015/03/creation-organisme-formation-1.jpg"),
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
                                            " Nos formations ", textAlign: TextAlign.center,
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
                                            child: TextField(

                                            ),
                                          )),
                                          SizedBox(height: 30,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 14,

                                    ),
                                    height: 100,

                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 34,

                                        ),
                                      ),
                                    ),
                                  ), ],);

                            }*/
                                Formation formation = _formations[index];
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
                                            link: formation.link)),
                                  ]);}



                      ),
              )),
                    // when the _loadMore function is running
                    if (_isLoadMoreRunning == true)
                    Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                    child: CircularProgressIndicator(),
                    ),
                    ),

                    // When nothing else to load
                    if (_hasNextPage == false)
                    Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.black,
                    child: Center(
                    child: Text('You have fetched all of the content'),
                    ),
                    ),



    ]





            //__________________________________Formations_____________________________








    ));
  }*/
  /*int currentPage = 1;
  int totalPages;


  List<Formation> formations = [];
  List<Formation> result =[];
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  Future<bool> getPassengerData({bool isRefresh = false}) async {


    final Uri uri = Uri.parse(
        "https://mdfive.dz/ecole/wp-json/wp/v2/formation?page=$currentPage&per_page=5");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      for(var u in jsonMap)
      {
        Formation formation = Formation.fromJson(u);
        result.add(formation);
      }

      if (isRefresh) {
        currentPage = 1;
      } else {
        if (result.length <= 0) {
          refreshController.loadNoData();
          return false;
        }
      }

      if (isRefresh) {

        formations = result;
      }else{
        formations.addAll(result);
      }

      currentPage++;


      print(response.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List Pagination"),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getPassengerData(isRefresh: true);
          print(result);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getPassengerData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: ListView.separated(
          itemBuilder: (context, index) {
            final formation = formations[index];

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
                link: formation.link)),
            ]);
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: formations.length,
        ),
      ),
    );
  }*/

  /*static int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List formations = new List();


  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Load Large List"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: formations.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == formations.length) {
          return _buildProgressIndicator();
        } else {
          final formation = formations[index];
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
                        link: formation.link)),
                       SizedBox(height:40) ]  );
        }
      },
      controller: _sc,
    );
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://mdfive.dz/ecole/wp-json/wp/v2/formation?page=" +
          index.toString() +
          "&per_page=5";
      print(url);
      final response = await http.get( Uri.parse(url));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      List tList = new List();

      for(var u in jsonMap)
      {
        Formation formation = Formation.fromJson(u);
        print(2);
        tList.add(formation);
      }

      setState(() {
        isLoading = false;
        formations.addAll(tList);
        page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }*/

}
