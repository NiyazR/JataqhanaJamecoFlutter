
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
import 'package:jihc/pages/News/newsdb.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'NotFoundPage.dart';
import 'Tarihibir.dart';

Widget MugalimList(BuildContext context, List<Newsdb> _teacherList) {
  Size size = MediaQuery.of(context).size;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double text = MediaQuery.textScaleFactorOf(context);
  print(width);
  if (_teacherList.length > 0) {
    return Container(margin: EdgeInsets.only(left: width/25,right: width/25),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _teacherList.length,
          itemBuilder: (context, i) {
            return teacherItem(context, _teacherList[i]);
          }),
    );
  } else {
    return bookNotFound(context);
  }
}


Widget teacherItem(BuildContext context, Newsdb newsdb) {
  Size size = MediaQuery.of(context).size;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double text = MediaQuery.textScaleFactorOf(context);
  print(width);
  return GestureDetector(
    child: Container(margin: EdgeInsets.only(left: width/50),
      child: Column(mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 12,
              ),
            ]),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(width / 45),
                      child: FadeInImage.assetNetwork(
                        placeholder:
                        'images/muga.png',
                        image: newsdb.image_class,
                        width: width / 3.5,
                        height: height/ 4,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: height/50),
          Container(width: width/3.25,
            child: Text(
              newsdb.name,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.040,
              ),
            ),
          )
        ],
      ),
    ),
    onTap: () async {},
  );
}