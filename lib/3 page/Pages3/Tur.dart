import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/pages/Profile/profile.dart';



import 'dart:ui';

import '../DrawerMain3.dart';
import 'Tarihdb.dart';





class Tur extends StatefulWidget {
  @override
  _TurState createState() => _TurState();
}

class _TurState extends State<Tur> {
  List<Tarihdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Tarih");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }
  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Tarihdb.fromSnapshot(event.snapshot));
    });
  }
  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Tarihdb.fromSnapshot(event.snapshot);
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
              leading: Builder(
                builder: (context) => IconButton(
                  tooltip: 'Меню JIHC',
                  icon: Icon(
                    Icons.menu,
                    color: Colors.teal,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [

                      Container(
                        margin: EdgeInsets.only(left: width / 25),
                        child: Text(
                          "Туры",
                          style: TextStyle(color: Colors.black, fontSize: width / 20),
                        ),
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
            drawer: DrawerMenu2(),
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
  Widget angimeItem(BuildContext context, Tarihdb tarihdb) {

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);

    return Column(

      children: [
        Column(
          children: [
            SizedBox(height: width / 15),
           Text(tarihdb.title),
            SizedBox(height: width / 5),

          ],
        ),


      ],
    );
  }
  Widget bookList(BuildContext context, List<Tarihdb> _angimeListNew) {
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

}
