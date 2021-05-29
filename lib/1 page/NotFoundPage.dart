

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

import 'Tarihibir.dart';



Widget bookNotFound(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double text = MediaQuery.textScaleFactorOf(context);
  print(width);
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Image.asset(
          "images/122d.gif",
          height: height / 6.7,
          width: height / 6.7,
        ),
      ],
    ),
  );
}