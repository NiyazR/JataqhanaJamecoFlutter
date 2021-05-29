import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jihc/pages/Mugalimder/Mugalimdb.dart';

import '../Profile/profile.dart';
import 'dart:ui';

class MugalimGrid extends StatefulWidget {
  @override
  _MugalimGridState createState() => _MugalimGridState();
}

class _MugalimGridState extends State<MugalimGrid> {
  List<Mugdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Mugalimder");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('onEntryAdded');

    setState(() {
      _angimeListNew.add(Mugdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Mugdb.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.teal),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: width / 25),
                  child: Text(
                    "Мұғалімдердің тізімі",
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 160,
                        childAspectRatio: 1.2 / 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    itemCount: _angimeListNew.length,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    itemBuilder: (context, i) {
                      return angimeItem(context, _angimeListNew[i]);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget angimeItem(BuildContext context, Mugdb mugdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
      child: GestureDetector(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 12,
                  ),
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width / 45),
                      bottomLeft: Radius.circular(width / 45),
                      bottomRight: Radius.circular(width / 45),
                      topRight: Radius.circular(width / 45),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/muga.png',
                      image: mugdb.image_class,
                      width: width / 3.5,
                      height: height / 4,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(height: height / 80),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 2),
                child: Text(
                  mugdb.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        onTap: () async {},
      ),
    );
  }
}
