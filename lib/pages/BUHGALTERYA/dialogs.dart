
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'buhgalteryadb.dart';
import 'custom_dialog_box.dart';

class Dialogs extends StatefulWidget {
  @override
  _DialogsState createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
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
            title: Text("Cus Dialog In Flutter"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
         body: Container(
           color: Colors.white,
           child: ListView.builder(
               scrollDirection: Axis.vertical,
               itemCount: _angimeListNew.length,
               padding: EdgeInsets.only(left: 10, right: 10, top: 10),
               itemBuilder: (context, i) {
                 return angimeItem(context, _angimeListNew[i]);
               }),
         )
        )
    );
  }

  Widget angimeItem(BuildContext context, Buhgdb buhgdb) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context){
                  return CustomDialogBox(
                    title: buhgdb.DialogAty,
                    descriptions: "Hi all this is a custom dialog in flutter and  you will be use in your flutter applications",
                    text: "s",
                  );
                }
            );
          },
          child: Text("Custom Dialog"),

        ),
      ),
    );
  }
}
