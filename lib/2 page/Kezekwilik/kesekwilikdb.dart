import 'package:firebase_database/firebase_database.dart';

class Kezdb {
  String key;
  String Aptakun;
  String title;
  String Aty;
  String Uakit;
  String Buhgsecondname;
  String Buhgekinum;
  String Basname;
  String Buhgbirnum;
  String Buhgbasnum;
  String OkyAky;
  String OkyData;
  String TamaqData;


  Kezdb({this.Aptakun,this.OkyAky,this.OkyData,this.TamaqData, this.title,this.Aty, this.Uakit, this.Buhgsecondname,this.Basname,this.Buhgbirnum,this.Buhgekinum,this.Buhgbasnum});

  Kezdb.fromSnapshot(DataSnapshot snapshot)
      : Basname = snapshot.value["Basname"],
        OkyData = snapshot.value["OkyData"],
        OkyAky = snapshot.value["OkyAky"],
        Aptakun = snapshot.value["Aptakun"],
        Aty = snapshot.value["Aty"],
        TamaqData = snapshot.value["TamaqData"],
        title = snapshot.value["title"],
        Uakit = snapshot.value["Uakit"],
        Buhgbirnum = snapshot.value["Buhgbirnum"],
        Buhgekinum = snapshot.value["Buhgekinum"],
        Buhgsecondname = snapshot.value["Buhgsecondname"],
        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "OkyAky": OkyAky,
      "Aty": Aty,
      "OkyData": OkyData,
      "Aptakun": Aptakun,
      "Buhgbasnum": Buhgbasnum,
      "Buhgbirnum": Buhgbirnum,
      "title": title,
      "Uakit": Uakit,
      "Buhgsecondname": Buhgsecondname,
      "Basname": Basname,
      "Buhgekinum" : Buhgekinum,
      "TamaqData": TamaqData,
    };
  }
}
