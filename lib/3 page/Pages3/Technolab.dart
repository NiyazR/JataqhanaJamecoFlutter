import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jihc/3%20page/Pages3/Basty.dart';
import 'package:jihc/3%20page/DrawerMain3.dart';
import 'package:jihc/3%20page/Pages3/Technolab.dart';
import 'package:jihc/3%20page/Pages3/tarih.dart';

import '../MezunPage/MezunFilter2.dart';
import 'Tur.dart';


class Technolab extends StatefulWidget {
  @override
  _TechnolabState createState() => _TechnolabState();
}

class _TechnolabState extends State<Technolab>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  TabController _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: width / 25),
                  child: Text(
                    "Technolab",
                    style: TextStyle(color: Colors.black, fontSize: width / 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(margin: EdgeInsets.only(right: width/20),
                  child: Stack(
                    children: <Widget>[


                      new Container(),

                    ],
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
      body: ListView(
        children: [
          SizedBox(height: width / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(   height: width / 2.2,
                width: width / 2.8,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                       Icon(Icons.android_outlined,size: width/5,color: Colors.teal,),

                    Container(width: width/5,
                      child: Text('Mobile Development',maxLines: 2,
                          textAlign: TextAlign.center,
                                style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    fontSize: width / 35)),
                    ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
              Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                height: width / 2.2,
                width: width / 2.8,
                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                        Icon(Icons.games_outlined,size: width/5,color: Colors.teal,),

                        Container(width: width/5,
                          child: Text('Game Development',maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 35)),
                        ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
            ],
          ),
          SizedBox(height: width / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                height: width / 2.2,
                width: width / 2.8,
                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                        Icon(Icons.print_rounded,size: width/5,color: Colors.teal,),

                        Container(width: width/5,
                          child: Text('Printing',maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 35)),
                        ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
              Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                height: width / 2.2,
                width: width / 2.8,
                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                        Icon(Icons.design_services_outlined,size: width/5,color: Colors.teal,),

                        Container(width: width/5,
                          child: Text('Design',maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 35)),
                        ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
            ],
          ),
          SizedBox(height: width / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                height: width / 2.2,
                width: width / 2.8,
                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                        Icon(Icons.wifi_tethering,size: width/5,color: Colors.teal,),

                        Container(width: width/5,
                          child: Text('Web Development',maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 35)),
                        ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
              Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular( 20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.5),
                    blurRadius: height / 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                height: width / 2.2,
                width: width / 2.8,
                child:   RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    highlightElevation: 900.0,
                    hoverColor: Colors.red,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: width/35),
                        Icon(Icons.data_usage,size: width/5,color: Colors.teal,),

                        Container(width: width/7,
                          child: Text('System Admin',maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 35)),
                        ),


                      ],
                    ),
                    textColor: Colors.black,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    disabledTextColor: Colors.black,
                    disabledColor: Colors.grey,
                    onPressed: () async {

                    }),
              ),
            ],
          ),
          SizedBox(height: width / 20),

        ],
      ),
      drawer: DrawerMenu2(),

    );
  }
}
