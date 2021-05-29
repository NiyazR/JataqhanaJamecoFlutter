import 'dart:math';

import 'package:jihc/3%20page/main3.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'LoginStudent.dart';
import 'LoginTeacher.dart';

class TandayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/jihcbac.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(color: Colors.teal.withOpacity(0.35)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      width: width / 1.3,
                      height: height / 9,
                      child: RaisedButton(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          highlightElevation: 20.0,
                          hoverColor: Colors.teal,
                          color: Colors.teal[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Студент',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width / 20)),
                            ],
                          ),
                          textColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          disabledTextColor: Colors.black,
                          disabledColor: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginDemo()),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: width / 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      width: width / 1.3,
                      height: height / 9,
                      child: RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        highlightElevation: 20.0,
                        hoverColor: Colors.teal,
                        color: Colors.teal[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text('Мұғалім',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width / 20)),
                            ),
                          ],
                        ),
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        disabledTextColor: Colors.black,
                        disabledColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginDemo2()),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: width / 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      width: width / 1.3,
                      height: height / 9,
                      child: RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        highlightElevation: 20.0,
                        hoverColor: Colors.teal,
                        color: Colors.teal[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text('Қонақ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width / 20)),
                            ),
                          ],
                        ),
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        disabledTextColor: Colors.black,
                        disabledColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TablePage3()),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: width / 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
