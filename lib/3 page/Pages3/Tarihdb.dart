import 'package:firebase_database/firebase_database.dart';

class Tarihdb {
  String key;
  String Name;
  String title;
  String title2;
  String title3;
  String title4;
  String title5;
  String title6;
  String title7;
  String Buhgbasnum;
  String OkyAky;
  String OkyData;
  String TamaqData;


  Tarihdb({this.Name,this. title3,this.OkyData,this.title4, this.title,this.title2,this.title6,this.title7,this.title5,this.Buhgbasnum});

  Tarihdb.fromSnapshot(DataSnapshot snapshot)
      : title5 = snapshot.value["title5"],
        OkyData = snapshot.value["OkyData"],
        OkyAky = snapshot.value["OkyAky"],
        Name = snapshot.value["Name"],
        title2 = snapshot.value["title2"],
        TamaqData = snapshot.value["TamaqData"],
        title = snapshot.value["title"],
        title3 = snapshot.value["title3"],
        title4 = snapshot.value["title4"],
        title6 = snapshot.value["title6"],
        title7 = snapshot.value["title7"];


  toJson() {
    return {
      "OkyAky": OkyAky,
      "title2": title2,
      "title3": title3,
      "title4": title4,
      "Buhgbasnum": Buhgbasnum,
      "title7": title7,
      "title": title,
      "title5": title5,
      "title6": title6,
      "TamaqData": TamaqData,
    };
  }
}
