import 'package:firebase_database/firebase_database.dart';

class Kizdb {
  String key;
  String title;
  String title1;
  String title2;
  String title3;
  String title4;
  String title5;
  String title6;
  String title7;
  String title8;
  String title9;
  String title10;
  String title11;
  String title12;
  String title13;
  String title14;
  String uakit;
  String uakit1;
  String uakit2;
  String uakit3;
  String uakit4;
  String uakit5;
  String uakit6;
  String uakit7;
  String uakit8;
  String uakit9;
  String uakit10;
  String uakit11;
  String uakit12;
  String uakit13;
  String uakit14;

  Kizdb({
    this.uakit,
    this.title,
    this.uakit1,
    this.title1,
    this.uakit2,
    this.title2,
    this.uakit3,
    this.title3,
    this.uakit4,
    this.title4,
    this.uakit5,
    this.title5,
    this.uakit6,
    this.title6,
    this.uakit7,
    this.title7,
    this.uakit8,
    this.title8,
    this.uakit9,
    this.title9,
    this.uakit10,
    this.title10,
    this.uakit11,
    this.title11,
    this.uakit12,
    this.title12,
    this.uakit13,
    this.title13,
    this.uakit14,
    this.title14,
  });

  Kizdb.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        title1 = snapshot.value["title"],
        title2 = snapshot.value["title"],
        title3 = snapshot.value["title"],
        title4 = snapshot.value["title"],
        title5 = snapshot.value["title"],
        title6 = snapshot.value["title"],
        title7 = snapshot.value["title"],
        title8 = snapshot.value["title"],
        title9 = snapshot.value["title"],
        title10 = snapshot.value["title"],
        title11 = snapshot.value["title"],
        title12 = snapshot.value["title"],
        title13 = snapshot.value["title"],
        title14 = snapshot.value["title"],
        uakit = snapshot.value["uakit"],
        uakit1 = snapshot.value["uakit1"],
        uakit2 = snapshot.value["uakit2"],
        uakit3 = snapshot.value["uakit3"],
        uakit4 = snapshot.value["uakit4"],
        uakit5 = snapshot.value["uakit5"],
        uakit6 = snapshot.value["uakit6"],
        uakit7 = snapshot.value["uakit7"],
        uakit8 = snapshot.value["uakit8"],
        uakit9 = snapshot.value["uakit9"],
        uakit10 = snapshot.value["uakit10"],
        uakit11 = snapshot.value["uakit11"],
        uakit12 = snapshot.value["uakit12"],
        uakit13 = snapshot.value["uakit13"],
        uakit14 = snapshot.value["uakit14"];

  toJson() {
    return {
      "title": title,
      "title1": title1,
      "title2": title2,
      "title3": title3,
      "title4": title4,
      "title5": title5,
      "title6": title6,
      "title7": title7,
      "title8": title8,
      "title9": title9,
      "title10": title10,
      "title11": title11,
      "title12": title12,
      "title13": title13,
      "title14": title14,
      "uakit": uakit,
      "uakit1": uakit1,
      "uakit2": uakit2,
      "uakit3": uakit3,
      "uakit4": uakit4,
      "uakit5": uakit5,
      "uakit6": uakit6,
      "uakit7": uakit7,
      "uakit8": uakit8,
      "uakit9": uakit9,
      "uakit10": uakit10,
      "uakit11": uakit11,
      "uakit12": uakit12,
      "uakit13": uakit13,
      "uakit14": uakit14,
    };
  }
}
