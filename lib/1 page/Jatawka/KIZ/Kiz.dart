import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'dart:ui';

import 'kizdb.dart';

class Kiz extends StatefulWidget {
  @override
  _KizState createState() => _KizState();
}

class _KizState extends State<Kiz> {
  List<Kizdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;
  Kizdb  kizdb = Kizdb(
      uakit: 'loading', title: 'loading',
      uakit1: 'loading', title1: 'loading',
      uakit2: 'loading', title2: 'loading',
      uakit3: 'loading', title3: 'loading',
      uakit4: 'loading', title4: 'loading',
      uakit5: 'loading', title5:'loading',
      uakit6: 'loading', title6: 'loading',
      uakit7: 'loading', title7: 'loading',
      uakit8: 'loading', title8: 'loading',
      uakit9: 'loading', title9: 'loading',
      uakit10: 'loading', title10: 'loading',
      uakit11: 'loading', title11: 'loading',
      uakit12:'loading', title12: 'loading',
      uakit13: 'loading', title13: 'loading',
      uakit14: 'loading', title14: 'loading'
  );

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("JatawkaKiz");


    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Kizdb.fromSnapshot(event.snapshot));

      print("title : "+_angimeListNew[0].title);
      List<String> rasporyadok = _angimeListNew[0].title.split(",");


      print("rasporyadok : "+rasporyadok[0]);


      kizdb = Kizdb(
          uakit: rasporyadok[0], title: rasporyadok[1],
          uakit1: rasporyadok[2], title1: rasporyadok[3],
          uakit2: rasporyadok[4], title2: rasporyadok[5],
          uakit3: rasporyadok[6], title3: rasporyadok[7],
          uakit4: rasporyadok[8], title4: rasporyadok[9],
          uakit5: rasporyadok[10], title5:rasporyadok[11],
          uakit6: rasporyadok[12], title6: rasporyadok[13],
          uakit7: rasporyadok[14], title7: rasporyadok[15],
          uakit8: rasporyadok[16], title8: rasporyadok[17],
          uakit9: rasporyadok[18], title9: rasporyadok[19],
          uakit10: rasporyadok[20], title10: rasporyadok[21],
          uakit11: rasporyadok[22], title11: rasporyadok[23],
          uakit12:rasporyadok[24], title12: rasporyadok[25],
          uakit13: rasporyadok[26], title13:rasporyadok[27],
          uakit14: rasporyadok[28], title14: rasporyadok[29],
      );


    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Kizdb.fromSnapshot(event.snapshot);
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


  Widget bookList(BuildContext context, List<Kizdb> _angimeListNew) {
    if (_angimeListNew.length > 0) {
      return Container(
        child: angimeItem(context, kizdb),
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
      child: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            "images/122d.gif",
            height: height /5,
            width: height / 1,
          ),
        ],
      ),
    );
  }

  Widget angimeItem(BuildContext context, Kizdb kizdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return ListView(
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Container(
            width: width / 1,

            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Column(
                children: [

                  Column(
                    children: [
                      SizedBox(height: width/14),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                         kizdb.uakit,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/5.5),
                          Text(
                         kizdb.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/14,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                           kizdb.uakit1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/5.5),
                          Text(
                           kizdb.title1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                          kizdb.uakit2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/5.5),
                          Text(
                            kizdb.title2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit3,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/5.5),
                          Text(
                            kizdb.title3,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit4,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title4,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit5,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title5,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit6,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title6,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit7,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title7,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit8,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title8,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit9,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title9,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit10,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title10,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit11,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title11,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit12,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title12,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit13,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title13,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: width/35),
                      Row(

                        children: [
                          SizedBox(width: width/6),
                          Text(
                            kizdb.uakit14,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: width/6),
                          Text(
                            kizdb.title14,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 25,

                            ),
                            textAlign: TextAlign.center,
                          ),




                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: width/10,
                      ),
                    ],
                  ),











                ],
              ),
            ),
          ),
        ),
        SizedBox(height: height/25)
      ],
    );
  }
}
