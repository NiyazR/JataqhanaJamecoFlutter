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
import 'package:jihc/pages/News/news_about.dart';
import 'package:jihc/pages/News/newsdb.dart';
import 'package:jihc/pages/Profile/profile.dart';

import 'NotFoundPage.dart';
import 'Tarihibir.dart';

Widget bookList(BuildContext context, List<Newsdb> _newsListNew) {
  Size size = MediaQuery.of(context).size;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double text = MediaQuery.textScaleFactorOf(context);
  print(width);
  if (_newsListNew.length > 0) {
    return Container(margin: EdgeInsets.only(left: width/25,right: width/25),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _newsListNew.length,
          itemBuilder: (context, i) {
            return NewsItem(context, _newsListNew[i]);
          }),
    );
  } else {
    return bookNotFound(context);
  }
}


Widget NewsItem(BuildContext context, Newsdb newsdb) {
  Size size = MediaQuery.of(context).size;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double text = MediaQuery.textScaleFactorOf(context);
  print(width);


  return GestureDetector(
    child: Container(margin: EdgeInsets.only(left: width/40,right: width/30),width: width/1.5,
      child: Column(mainAxisSize: MainAxisSize.max,
        children: [
          Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width / 45),
                  bottomLeft: Radius.circular(width / 45),
                  bottomRight: Radius.circular(width / 45),
                  topRight: Radius.circular(width / 45),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/whitelogo.png.png',
                  image: newsdb.image_class,
                  width: width / 3,
                  height: width / 3.75,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: width / 1,
              height: width / 3.72,
              child: RaisedButton(
                color: Colors.white.withOpacity(0.0),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            News_aboutt(newsdb: newsdb)),
                  );
                },
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: width / 1,
                  height: width / 3.72,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width / 25),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.0,
                            0.5,
                            0.9
                          ],
                          colors: [
                            Colors.indigo.withOpacity(0.0),
                            Colors.blueAccent,
                            Colors.teal[400]
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin:
              EdgeInsets.only(left: width / 2.8, top: width / 18),
              child: Column(
                children: [
                  SizedBox(
                    width: width / 4,
                    child: Text(
                      newsdb.name,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 36),
                    ),
                  ),
                  SizedBox(height: width / 100),
                  Text(
                    newsdb.maxname,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width / 20),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    ),
    onTap: () async {},
  );

}
