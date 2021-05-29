import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dart:ui';

import 'news_about.dart';
import 'newsdb.dart';

class NewsPagebir extends StatefulWidget {
  @override
  _NewsPagebirState createState() => _NewsPagebirState();
}

class _NewsPagebirState extends State<NewsPagebir> {
  List<Newsdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("news");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Newsdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Newsdb.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);

    return Container(
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(color: Colors.teal),

              title: Row(
                children: [
                  IconButton(
                      icon: new Icon(
                        Icons.home_rounded,
                        size: width / 15,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Container(
                    margin: EdgeInsets.only(left: width / 25),
                    child: Text(
                      "Жаңалықтардың тізімі",
                      style: TextStyle(
                          color: Colors.black, fontSize: width / 20),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[],

              //<Widget>[]
              backgroundColor: Colors.white,
              elevation: 5.0,

              //IconButton
            ),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  
                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _angimeListNew.length,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      itemBuilder: (context, i) {
                        return angimeItem(context, _angimeListNew[i]);
                      }),
                ],
              ),
            )

        )


    );
  }
  Widget bookNotFound(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "images/122d.gif",
            height: height / 6.7,
            width: height / 1,
          ),
        ],
      ),
    );
  }

  Widget bookList(BuildContext context, List<Newsdb> _angimeListNew) {
    if (_angimeListNew.length > 0) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _angimeListNew.length,

            itemBuilder: (context, i) {
              return angimeItem(context, _angimeListNew[i]);
            }),
      );
    } else {
      return bookNotFound(context);
    }
  }
  Widget angimeItem(BuildContext context, Newsdb newsDb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        margin: EdgeInsets.only(top: width / 500),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width / 60),
                            bottomLeft: Radius.circular(width / 60),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/whitelogo.png.png',
                            image: newsDb.image_class,
                            width: width / 3.5,
                            height: width / 3.75,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: width / 25),
                      Container(
                        width: width / 3,
                        child: Column(
                          children: [
                            Text(
                              newsDb.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: width / 25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.teal,
                          size: height / 25,
                        ),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    News_aboutt(newsdb: newsDb)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
