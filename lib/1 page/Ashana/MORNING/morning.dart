import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/1%20page/Ashana/AFTERNOON/afternoondb.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'dart:ui';

import 'morningdb.dart';





class Morning extends StatefulWidget {
  @override
  _MorningState createState() => _MorningState();
}

class _MorningState extends State<Morning> {
  List<Mordb > _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("AshanaTan");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Mordb .fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Mordb.fromSnapshot(event.snapshot);
    });
  }
   Future<Null> getRefresh() async {
     await Future.delayed(Duration(seconds: 3));


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
            body: Container(
              color: Colors.white,
              child: RefreshIndicator(
                  onRefresh: getRefresh,
                  backgroundColor: Colors.teal,
                  color: Colors.white,
                  child: bookList(context, _angimeListNew)
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
  Widget angimeItem(BuildContext context, Mordb  mordb ) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return  Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Container(
              width: width / 1,

              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),

                child: Column(
                  children: [

                    Column(
                      children: [
                        SizedBox(height: width/14),
                        Row(mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            SizedBox(width: width/25),
                            Container(margin: EdgeInsets.only(left: width/50),
                              child: Text(
                                mordb.Aptakun,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: width * 0.040,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: width / 15),
                            Row(
                              children: [

                                Icon(
                                    Icons.calendar_today,
                                    color: Colors.black,
                                    size: width/20 ),
                                SizedBox(width: width/35),
                                Text(
                                  mordb.Uakit,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.035,

                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),




                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          height: width/15,
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width/35),
                        Container(margin: EdgeInsets.only(left: width/15),
                          child: Text(
                            mordb.Asbir,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: width/10,
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width/35),
                        Container(margin: EdgeInsets.only(left: width/15),
                          child: Text(
                            mordb.Aseki,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: width/10,
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width/35),
                        Container(margin: EdgeInsets.only(left: width/15),
                          child: Text(
                            mordb.Asuw,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: width/10,
                        ),
                      ],
                    ),     Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width/35),
                        Container(margin: EdgeInsets.only(left: width/15),
                          child: Text(
                            mordb.Astort,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          height: width/15,
                        ),
                      ],
                    ),













                  ],
                ),
              ),
            ),
          ),
        ],
      );

  }


  Widget bookList(BuildContext context, List<Mordb> _angimeListNew) {
    if (_angimeListNew.length > 0) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _angimeListNew.length,
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            itemBuilder: (context, i) {
              return angimeItem(context, _angimeListNew[i]);
            }),
      );
    } else {
      return bookNotFound(context);
    }
  }
}
