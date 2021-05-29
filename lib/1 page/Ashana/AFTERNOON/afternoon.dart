import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'dart:ui';

import 'afternoondb.dart';

class Afternoon extends StatefulWidget {
  @override
  _AfternoonState createState() => _AfternoonState();
}

class _AfternoonState extends State<Afternoon> {
  List<Tusdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("AshanaTus");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Tusdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Tusdb.fromSnapshot(event.snapshot);
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
  Widget bookList(BuildContext context, List<Tusdb> _angimeListNew) {
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
  Widget angimeItem(BuildContext context, Tusdb tusdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Column(
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
                      SizedBox(height: width / 14),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width / 25),
                          Container(
                            margin: EdgeInsets.only(left: width / 50),
                            child: Text(
                              tusdb.Aptakun,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: width * 0.040,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Row(
                            children: [
                              SizedBox(width: width / 15),
                              Icon(Icons.calendar_today,
                                  color: Colors.black, size: width / 20),
                              SizedBox(width: width / 35),
                              Text(
                                tusdb.Uakit,
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
                        height: width / 15,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width / 35),
                      Container(
                        margin: EdgeInsets.only(left: width / 15),
                        child: Text(
                          tusdb.Asbir,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width / 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width / 35),
                      Container(
                        margin: EdgeInsets.only(left: width / 15),
                        child: Text(
                          tusdb.Aseki,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width / 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width / 35),
                      Container(
                        margin: EdgeInsets.only(left: width / 15),
                        child: Text(
                          tusdb.Asuw,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width / 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width / 35),
                      Container(
                        margin: EdgeInsets.only(left: width / 15),
                        child: Text(
                          tusdb.Astort,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        height: width / 15,
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
}
