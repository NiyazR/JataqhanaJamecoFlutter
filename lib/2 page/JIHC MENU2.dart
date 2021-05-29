
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jihc/1%20page/Ashana/Ashana.dart';
import 'package:jihc/1%20page/Jatawka/Jataqhana.dart';
import 'package:jihc/1%20page/UIRME/uyirme.dart';
import 'package:jihc/2%20page/JINALYS/Jinalys.dart';
import 'package:jihc/2%20page/Kezekwilik/kezekwilik.dart';
import 'package:jihc/3%20page/DrawerMain3.dart';

import 'package:jihc/3%20page/Pages3/tarih.dart';

import 'package:jihc/pages/BUHGALTERYA/buhgalterya.dart';

import 'package:jihc/pages/Mugalimder/Mugalim_grid.dart';
import 'package:jihc/pages/Profile/profile.dart';






class Jihcmenu2 extends StatefulWidget {
  _Jihcmenu2State createState() => _Jihcmenu2State();
}

class _Jihcmenu2State extends State<Jihcmenu2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return  Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Container(
                            height: width / 2.8,
                            width: width / 2.2,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(width / 40),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(
                                          Colors
                                              .black
                                              .withOpacity(
                                              0.3),
                                          BlendMode.srcOver),
                                      image: AssetImage(
                                          'images/ashana.jpg'),
                                    ),
                                  ),
                                  child: Container(
                                      height:
                                      MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                      MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 6, left: 15),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: width / 8, top: width / 9),
                            child: Column(
                              children: [
                                Text(
                                  ' Асхана',
                                  style: TextStyle(
                                      fontSize: width / 18,
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                Text(
                                  '  МЕНЮ',
                                  style: TextStyle(
                                      fontSize: width / 18,
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ashana()),
                  );
                },
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Container(
                            height: width / 2.8,
                            width: width / 2.2,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(width / 40),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(
                                          Colors
                                              .black
                                              .withOpacity(
                                              0.2),
                                          BlendMode.srcOver),
                                      image: AssetImage(
                                          'images/jinalys.jpg'),
                                    ),
                                  ),
                                  child: Container(
                                      height:
                                      MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                      MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 6, left: 15),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: width / 10,
                                  top: width / 7),
                              child: Text(
                                'Жиналыстар',
                                style: TextStyle(
                                    fontSize: width / 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Jinalys()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: width / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Container(
                            height: width / 2.8,
                            width: width / 2.2,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(width / 40),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(
                                          Colors
                                              .black
                                              .withOpacity(
                                              0.2),
                                          BlendMode.srcOver),
                                      image: AssetImage(
                                          'images/clock.jpg'),
                                    ),
                                  ),
                                  child: Container(
                                      height:
                                      MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                      MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 6, left: 15),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: width / 10,
                                  top: width / 7),
                              child: Text(
                                'Кезекшілік',
                                style: TextStyle(
                                    fontSize: width / 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Kezekwilik()),
                  );
                },
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Container(
                            height: width / 2.8,
                            width: width / 2.2,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(width / 40),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(
                                          Colors
                                              .black
                                              .withOpacity(
                                              0.2),
                                          BlendMode.srcOver),
                                      image: AssetImage(
                                          'images/shah.jpg'),
                                    ),
                                  ),
                                  child: Container(
                                      height:
                                      MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                      MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 6, left: 15),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: width / 10,
                                  top: width / 7),
                              child: Text(
                                'Бухгалтерия',
                                style: TextStyle(
                                    fontSize: width / 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Buhgalterya()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );

  }
}

