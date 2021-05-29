import 'package:firebase_database/firebase_database.dart';

class Evdb {
  String key;
  String Aptakun;
  String title;
  String Aty;
  String Uakit;
  String Asbir;
  String Asuw;
  String Aseki;
  String Astort;
  String Buhgbasnum;
  String OkyAky;
  String OkyData;
  String TamaqData;


  Evdb({this.Aptakun,this.OkyAky,this.OkyData,this.TamaqData, this.title,this.Aty, this.Uakit, this.Asbir,this.Aseki,this.Astort,this.Asuw,this.Buhgbasnum});

  Evdb.fromSnapshot(DataSnapshot snapshot)
      : Aseki = snapshot.value["Aseki"],
        OkyData = snapshot.value["OkyData"],
        OkyAky = snapshot.value["OkyAky"],
        Aptakun = snapshot.value["Aptakun"],
        Aty = snapshot.value["Aty"],
        TamaqData = snapshot.value["TamaqData"],
        title = snapshot.value["title"],
        Uakit = snapshot.value["Uakit"],
        Astort = snapshot.value["Astort"],
        Asuw = snapshot.value["Asuw"],
        Asbir = snapshot.value["Asbir"],
        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "OkyAky": OkyAky,
      "Aty": Aty,
      "OkyData": OkyData,
      "Aptakun": Aptakun,
      "Buhgbasnum": Buhgbasnum,
      "Astort": Astort,
      "title": title,
      "Uakit": Uakit,
      "Asbir": Asbir,
      "Aseki": Aseki,
      "Asuw" : Asuw,
      "TamaqData": TamaqData,
    };
  }
}
