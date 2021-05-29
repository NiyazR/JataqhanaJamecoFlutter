import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'package:url_launcher/url_launcher.dart';

class Sabakkestesy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: width / 25),
                  child: Text(
                    "Кітапхана",
                    style: TextStyle(color: Colors.black, fontSize: width / 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: new Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
                IconButton(
                  icon: new Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
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
        elevation: 50.0,

        //IconButton
      ),
      body: ListView(
        children: [
          Column(
            children: [




              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                      height: width/15,
                                    ),
                                    Text(
                                      'Бас бухгалтер',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width / 26,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Исабекова Дарина',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 26,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: width/20,
                                    ),
                                    Text(
                                      'Бас бухгалтер',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width / 26,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Исабекова Дарина',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 26,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: width/20,
                                    ),
                                    Text(
                                      'Бас бухгалтер',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width / 26,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Исабекова Дарина',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 26,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                      height: width/7,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Colors.green,
                                          size: width/20,
                                        ),

                                        SizedBox(width: width/35),
                                        Text(
                                          '8 777 389 98 96',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width / 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: width/8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Colors.green,
                                          size: width/20,
                                        ),

                                        SizedBox(width: width/35),
                                        Text(
                                          '8 777 389 98 96',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width / 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: width/9,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Colors.green,
                                          size: width/20,
                                        ),

                                        SizedBox(width: width/35),
                                        Text(
                                          '8 777 389 98 96',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width / 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: width / 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: width / 10),


            ],
          ),
        ],
      ),
    );
  }

// This widget will be passed as Top Card's Widget.

}
