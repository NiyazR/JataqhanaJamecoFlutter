import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/pages/Profile/profile.dart';



import 'dart:ui';

import 'uirmedb.dart';



class Uirme extends StatefulWidget {
  @override
  _UirmeState createState() => _UirmeState();
}

class _UirmeState extends State<Uirme> {
  List<Uidb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Uyirme");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }
  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Uidb.fromSnapshot(event.snapshot));
    });
  }
  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Uidb.fromSnapshot(event.snapshot);
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
                            size: width/15,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width / 25),
                        child: Text(
                          "Үйірмелер",
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
  Widget angimeItem(BuildContext context, Uidb uidb) {

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
              padding: EdgeInsets.all(10),
              child: Container(
                width: width/1,
                height: width/1.5,

                child: Center(
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2), BlendMode.srcOver),
                            image: NetworkImage(
                                uidb.Ui_image),
                          ),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 6, left: 25),
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          uidb.Aty,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: width/20,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: height/55),
                                        Row(
                                          children: [
                                            new Icon(
                                              Icons.calendar_today,
                                              color: Colors.white,size: height/35,
                                            ),

                                            SizedBox(width: width/30,),
                                            Text(
                                              uidb.Aptakun,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: width/24,

                                                backgroundColor:
                                                Colors.white.withOpacity(0.0),
                                                fontFamily: 'Comfortaa',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height/55),
                                        Row(
                                          children: [
                                            new Icon(
                                              Icons.access_time,
                                              color: Colors.white,size: height/35,
                                            ),

                                            SizedBox(width: width/30,),
                                            Text(
                                              uidb.Uakit,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: width/24,

                                                backgroundColor:
                                                Colors.white.withOpacity(0.0),
                                                fontFamily: 'Comfortaa',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height/55),
                                        Row(
                                          children: [
                                            new Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: height/35,
                                            ),

                                            SizedBox(width: width/30,),
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  uidb.Nomer,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: width/24,

                                                    backgroundColor:
                                                    Colors.white.withOpacity(0.0),
                                                    fontFamily: 'Comfortaa',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: width/5),
                                                Text(
                                                  uidb.NomerZapas,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: width/24,

                                                    backgroundColor:
                                                    Colors.white.withOpacity(0.0),
                                                    fontFamily: 'Comfortaa',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height/40),
                                        Row(
                                          children: [

                                            Text(
                                              uidb.Basqaruwi,
                                              maxLines: 2,

                                              style: TextStyle(
                                                fontSize: width/24,fontWeight: FontWeight.bold,

                                                backgroundColor:
                                                Colors.white.withOpacity(0.0),
                                                fontFamily: 'Comfortaa',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: width/5)
          ],
        ),


      ],
    );
  }
  Widget bookList(BuildContext context, List<Uidb> _angimeListNew) {
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
