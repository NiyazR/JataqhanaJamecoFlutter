import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';


import 'dart:ui';

import 'jinalysdb.dart';


class Jinalys extends StatefulWidget {
  @override
  _JinalysState createState() => _JinalysState();
}

class _JinalysState extends State<Jinalys> {
  List<Jinadb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Jinalys");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Jinadb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Jinadb.fromSnapshot(event.snapshot);
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
            appBar: AppBar(
              automaticallyImplyLeading: false,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                          "Жиналыстар",
                          style: TextStyle(color: Colors.black, fontSize: width / 20),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width / 20),
                        child: Stack(
                          children: <Widget>[
                            new IconButton(
                                icon: new Icon(
                                  Icons.notifications_none,
                                  color: Colors.black,
                                ),
                                onPressed: () {}),
                            new Container(),
                            new Positioned(
                                child: new Stack(
                                  children: <Widget>[
                                    new Icon(Icons.brightness_1,
                                        size: 20.0, color: Colors.red),
                                    new Positioned(
                                        top: 4.0,
                                        right: 5.0,
                                        child: new Center(
                                          child: new Text(
                                            '1',
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: new Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,_){
                            return SecondRoute();


                          }
                          )

                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[

              ],

              //<Widget>[]
              backgroundColor: Colors.white,
              elevation: 5.0,

              //IconButton
            ),
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
  Widget bookList(BuildContext context, List<Jinadb> _angimeListNew) {
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
  Widget angimeItem(BuildContext context, Jinadb jinadb) {

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Column(
      children: [
        Column(
          children: [

            Divider(color: Colors.black87,),

            Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(

                  children: [

                    Container(margin: EdgeInsets.only(left: width/5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.black,
                            height: width/30,
                          ),
                          Text(
                            'Күні',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 26,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Colors.black,
                            height: width/30,
                          ),
                          Text(
                            'Уақыты:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 26,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Colors.black,
                            height: width/30,
                          ),
                          Text(
                            'Орны::',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 26,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: width/8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.black,
                          height: width/30,
                        ),
                        Text(
                          jinadb.Kuni,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Colors.black,
                          height: width/30,
                        ),
                        Text(
                          jinadb.Uakit,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Colors.black,
                          height: width/30,
                        ),
                        Text(
                          jinadb.Orny,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
            SizedBox(height: width/25),

          ],
        ),




      ],
    );
  }
}
