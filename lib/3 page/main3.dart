import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:jihc/1%20page/Newswidget.dart';

import 'package:jihc/1%20page/Teacherwidget.dart';

import 'package:jihc/3%20page/DrawerMain3.dart';

import 'package:jihc/3%20page/Pages3/tarih.dart';


import 'package:jihc/pages/Mugalimder/Mugalim_grid.dart';
import 'package:jihc/pages/News/news.dart';
import 'package:jihc/pages/News/newsdb.dart';

import 'JIHC MENU3.dart';
import 'Pages3/Tarihtext.dart';

class TablePage3 extends StatefulWidget {
  final String dbName;

  const TablePage3({Key key, this.dbName}) : super(key: key);

  @override
  _TablePage3State createState() => _TablePage3State();
}

class _TablePage3State extends State<TablePage3> {
  List<Newsdb> _newsListNew, _teacherList;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Query _newsQueryNew, _teacherQuery;

  @override
  void initState() {
    super.initState();
    _newsListNew = new List();
    _teacherList = new List();

    _newsQueryNew = _database.reference().child("news");

    _teacherQuery = _database.reference().child("Mugalimder");

    // .orderByChild("name")
    // .equalTo(widget.userId);

    _newsQueryNew.onChildAdded.listen(onEntryAdded);
    // _bookQueryNew.onChildChanged.listen(onEntryChanged);

    _teacherQuery.onChildAdded.listen(onEntryAdded2);
    // _bookQueryMostReaded.onChildChanged.listen(onEntryChanged2);
  }

  onEntryAdded(Event event) {
    setState(() {
      _newsListNew.add(Newsdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _newsListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _newsListNew[_newsListNew.indexOf(oldEntry)] =
          Newsdb.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded2(Event event) {
    setState(() {
      _teacherList.add(Newsdb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged2(Event event) {
    print('onEntryChanged');

    var oldEntry = _teacherList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _teacherList[_teacherList.indexOf(oldEntry)] =
          Newsdb.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
        color: Colors.white,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(color: Colors.teal),
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
                          "Басты",
                          style: TextStyle(
                              color: Colors.black, fontSize: width / 20),
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
            drawer: DrawerMenu2(),
            body: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Expanded(
                    child: ListView(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: width / 50, top: height / 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                            shadowColor: Colors.red,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsPagebir()),
                            );
                          },
                          child: const Text(
                            'Жаңалықтар',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: width / 40),
                  Container(
                      height: width / 2.75,
                      child: bookList(context, _newsListNew)),
                  Container(
                    margin: EdgeInsets.only(left: width / 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                            shadowColor: Colors.red,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TarihText()),
                            );
                          },
                          child: const Text(
                            'JIHC',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: width / 25),
                  Jihcmenu3(),
                  SizedBox(height: width / 25),
                  Container(
                    margin: EdgeInsets.only(left: width / 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                            shadowColor: Colors.red,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MugalimGrid()),
                            );
                          },
                          child: const Text(
                            'Мұғалімдер',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: width / 25),
                  Container(
                      height: height / 2.75,
                      child: MugalimList(context, _teacherList)),
                  SizedBox(height: width / 15),
                ]))
              ]),
            )));
  }
}
