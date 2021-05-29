import 'package:firebase_database/firebase_database.dart';

class Jinadb {
  String key;
  String Orny;
  String title;
  String Uakit;

  String Kuni;
  String Buhgbirnum;
  String Buhgbasnum;
  String OkyAky;
  String OkyData;
  String TamaqData;


  Jinadb({this.Orny,this.OkyAky,this.OkyData,this.TamaqData, this.title,this.Uakit, this.Kuni,this.Buhgbirnum,this.Buhgbasnum});

  Jinadb.fromSnapshot(DataSnapshot snapshot)
      : Kuni = snapshot.value["Kuni"],
        OkyData = snapshot.value["OkyData"],
        OkyAky = snapshot.value["OkyAky"],
        Orny = snapshot.value["Orny"],
        Uakit = snapshot.value["Uakit"],
        TamaqData = snapshot.value["TamaqData"],
        title = snapshot.value["title"],

        Buhgbirnum = snapshot.value["Buhgbirnum"],

        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "OkyAky": OkyAky,
      "Uakit": Uakit,
      "OkyData": OkyData,
      "Orny": Orny,
      "Buhgbasnum": Buhgbasnum,
      "Buhgbirnum": Buhgbirnum,
      "title": title,

      "Kuni": Kuni,

      "TamaqData": TamaqData,
    };
  }
}
