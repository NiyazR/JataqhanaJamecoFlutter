import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Profile/profile.dart';
import 'dart:ui';

import 'buhgalteryadb.dart';
import 'custom_dialog_box.dart';

class Buhgalterya extends StatefulWidget {
  @override
  _BuhgalteryaState createState() => _BuhgalteryaState();
}

class _BuhgalteryaState extends State<Buhgalterya> {
  List<Buhgdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Buhalterya");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Buhgdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Buhgdb.fromSnapshot(event.snapshot);
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
                          "Бухгалтерия",
                          style: TextStyle(
                              color: Colors.black, fontSize: width / 20),
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
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (context, animation, _) {
                            return SecondRoute();
                          }));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[],

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
                  child: bookList(context, _angimeListNew)),
            )));
  }

  Widget bookNotFound(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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

  Widget angimeItem(BuildContext context, Buhgdb buhgdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                width: width / 1,
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                color: Colors.black,
                                height: width / 35,
                              ),
                              Text(
                                'Бас бухгалтер',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.040,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    buhgdb.Basname,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: width / 15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.green,
                                        size: width / 20,
                                      ),
                                      SizedBox(width: width / 35),
                                      Text(
                                        buhgdb.Buhgekinum,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                height: width / 20,
                              ),
                              Text(
                                'Бухгалтер',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.040,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: <Widget>[
                                  Text(
                                    buhgdb.Buhgfirstname,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: width / 15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.green,
                                        size: width / 20,
                                      ),
                                      SizedBox(width: width / 35),
                                      Text(
                                        buhgdb.Buhgekinum,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                height: width / 20,
                              ),
                              Text(
                                'Бухгалтер',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.040,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    buhgdb.Buhgsecondname,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: width / 35),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.green,
                                        size: width / 20,
                                      ),
                                      SizedBox(width: width / 35),
                                      Text(
                                        buhgdb.Buhgekinum,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: width / 18)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: width / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: width / 15),
                    child: Text(
                      'Тамаққа төлем',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.055,
                      ),
                    )),
              ],
            ),
            SizedBox(height: width / 30),
            Container(
              margin: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Center(
                child: RaisedButton(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 17, bottom: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.teal[300],
                  elevation: 2,
                  focusElevation: 4,
                  hoverElevation: 4,
                  highlightElevation: 8,
                  disabledElevation: 0,
                  textColor: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            title: "Custom Dialog Demo",
                            descriptions:
                                "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                            text: "Yes",
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            buhgdb.OkyData,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: width / 55),
                          Text(
                            buhgdb.Tamaq,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: width / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: width / 15),
                    child: Text(
                      'Айлық',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.055,
                      ),
                    )),
              ],
            ),
            SizedBox(height: width / 30),
            Container(
              margin: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Center(
                child: RaisedButton(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 17, bottom: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.teal[300],
                  elevation: 2,
                  focusElevation: 4,
                  hoverElevation: 4,
                  highlightElevation: 8,
                  disabledElevation: 0,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            buhgdb.OkyData,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: width / 55),
                          Text(
                            buhgdb.OkyAky,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: width / 5)
          ],
        ),
        SizedBox(height: width / 10),
      ],
    );
  }

  Widget bookList(BuildContext context, List<Buhgdb> _angimeListNew) {
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
