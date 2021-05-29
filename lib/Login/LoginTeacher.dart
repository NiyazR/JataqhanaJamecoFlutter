import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jihc/1%20page/main1.dart';
import 'package:jihc/2%20page/main2.dart';
import 'package:jihc/3%20page/main3.dart';
import 'package:jihc/Login/screen/home.dart';

import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  _LoginDemo2State createState() => _LoginDemo2State();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Kaz'),
      Company(2, 'Rus'),
    ];
  }
}

class LoginDemo2 extends StatefulWidget {
  @override
  _LoginDemo2State createState() => _LoginDemo2State();
}

class _LoginDemo2State extends State<LoginDemo2> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: height / 25),
            Container(
              margin: EdgeInsets.only(right: width / 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Theme(
                    data: new ThemeData(
                        canvasColor: Colors.teal,
                        primaryColor: Colors.teal[400],
                        accentColor: Colors.teal[400],
                        hintColor: Colors.teal[400]),
                    child: DropdownButton(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 20,
                          fontWeight: FontWeight.bold),
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 10),
            Text('JIHC',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width / 15)),
            SizedBox(height: height / 15),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(width / 50),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(width / 50),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 50),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Логин',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      hintText: 'Логин енгізіңіз',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),

              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(width / 50),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(width / 50),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 50),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Құпиясөз',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      hintText: 'Құпиясөз енгізіңіз',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 20),
            Container(
              height: width / 9,
              width: width / 2.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width / 25)),
              child: FlatButton(
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((_) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TablePage2()));
                  });
                },
                child: Text(
                  'Кіру',
                  style:
                      TextStyle(color: Colors.teal[300], fontSize: width / 18),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
