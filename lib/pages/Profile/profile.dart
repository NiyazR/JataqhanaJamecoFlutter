import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dart:ui';

import 'Profiledb.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  List<Iddb> _angimeListNew;
  FirebaseDatabase _database;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;
  Iddb userInfo  =  Iddb( mugalimi: 'loading',iid: 'loading',toby: 'loading',atyzhoni: 'loading',iin: 'loading',

  );

  @override
  void initState() {
    super.initState();

    _angimeListNew =  List();

    _database = FirebaseDatabase.instance;
    _angimeQuery = _database.reference().child("Profile");
    print('initState');
    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      userInfo = Iddb.fromSnapshot(event.snapshot);
      print("(userInfo.name: "+userInfo.mugalimi);

    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Iddb.fromSnapshot(event.snapshot);
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);



    return Container(child: Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 1000),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.8, 1],
                        colors: [Colors.indigo, Colors.indigoAccent]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: width / 1.5),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL,
                        speed: 1000,
                        onFlipDone: (status) {

                        },
                        front: Stack(
                          children: [
                            Container(
                              height: width / 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [
                                      0.25,
                                      0.8,
                                      1
                                    ],
                                    colors: [
                                      Colors.teal[400],
                                      Colors.blueAccent,
                                      Colors.indigo
                                    ]),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.tealAccent.withOpacity(0.45),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        7, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                              width: width / 4,
                                              child: Text(
                                                'Сапалы білім , саналы тәрбие ',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width / 29,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              )),
                                          SizedBox(height: width / 40),
                                        ],
                                      ),
                                      Container(
                                        width: width / 3.5,
                                        height: width / 2.5,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(userInfo.image_class),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.white60,
                                              width: 1,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(height: width / 1.6),
                                Container(
                                    margin: EdgeInsets.only(left: width / 3),
                                    child: Text(
                                      'KTK',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width / 40),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        back: Stack(
                          children: [
                            Container(
                              height: width / 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [
                                      0.2,
                                      0.8,
                                      1
                                    ],
                                    colors: [
                                      Colors.teal[400],
                                      Colors.blueAccent,
                                      Colors.indigo
                                    ]),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.tealAccent.withOpacity(0.45),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        7, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ID:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Аты- жөні:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Тобы:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Мұғалім:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'ИИН:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                      SizedBox(
                                        height: width / 2.7,
                                        child: Container(
                                          width: width / 500,
                                          height: double.maxFinite,
                                          color: Colors.white60,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userInfo.iid,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            userInfo.atyzhoni,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            userInfo.toby,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            userInfo.mugalimi,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            userInfo.iin,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: width / 15, top: width / 15),
                          width: width / 10,
                          height: width / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width / 55),
                              border: Border.all(
                                  color: Colors.grey[300], width: 1)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.indigo[500].withOpacity(0.8),
                              size: width / 10,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: width / 5.5),
                    Container(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('images/111.png'),
                        width: width / 2.5,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            builder: (context, value, child) {
              return ShaderMask(
                shaderCallback: (rect) {
                  return RadialGradient(
                    radius: value * 5,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.55, 0.6, 1.0],
                    center: FractionalOffset(0.90, 0.1),
                  ).createShader(rect);
                },
                child: child,
              );
            },
          ),
        );
      },
    )));
  }

  Widget angimeItem(BuildContext context, Iddb iddb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Column(
      children: [],
    );
  }
}