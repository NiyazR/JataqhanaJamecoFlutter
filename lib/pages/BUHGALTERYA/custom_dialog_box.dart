import 'dart:async';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'buhgalteryadb.dart';
import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  List<Buhgdb> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("Buhalterya");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 150, bottom: 150),
          scrollDirection: Axis.vertical,
          itemCount: _angimeListNew.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                angimeItem(context, _angimeListNew[i]),
              ],
            );
          }),
    );
  }

  Widget angimeItem(BuildContext context, Buhgdb buhgdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.teal, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                buhgdb.DialogAty,
                style: TextStyle(
                    fontSize: width * 0.05, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: height / 80),
              Divider(color: Colors.grey),
              SizedBox(height: height / 80),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(

                              child: Text(
                                'Таңғы ас',
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                ),
                              )),
                          SizedBox(width: width / 9.5),
                          Text(
                            buhgdb.DialogTan,
                            style: TextStyle(
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                          child: Text(
                            'Түскі ас',
                            style: TextStyle(
                              fontSize: width * 0.045,
                            ),
                          )),
                      SizedBox(width: width / 8),
                      Text(
                      buhgdb.DialogTus,
                        style: TextStyle(
                          fontSize: width * 0.045,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                          child: Text(
                            'Кешкі ас',
                            style: TextStyle(
                              fontSize: width * 0.045,
                            ),
                          )),
                      SizedBox(width: width / 9.5),
                      Text(
                        buhgdb.DialogKew,
                        style: TextStyle(
                          fontSize: width * 0.045,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Кері қайту',
                      style: TextStyle( fontSize: width * 0.047,),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("images/jihc.jpg")),
          ),
        ),
      ],
    );
  }
}
