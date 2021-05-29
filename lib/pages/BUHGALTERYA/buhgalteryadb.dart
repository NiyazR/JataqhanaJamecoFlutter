import 'package:firebase_database/firebase_database.dart';

class Buhgdb {
  String key;
  String Buhgfirstname;
  String title;
  String Tamaq;
  String Basnomer;
  String Buhgsecondname;
  String Buhgekinum;
  String Basname;
  String Buhgbirnum;
  String Buhgbasnum;
  String OkyAky;
  String OkyData;
  String TamaqData;
  String DialogAty;
  String DialogTan;
  String DialogTus;
  String DialogKew;
  String Stepend;



  Buhgdb({this.Buhgfirstname,this.DialogKew,this.Stepend,this.DialogTus,this.DialogTan,this.DialogAty,this.OkyAky,this.OkyData,this.TamaqData, this.title,this.Tamaq, this.Basnomer, this.Buhgsecondname,this.Basname,this.Buhgbirnum,this.Buhgekinum,this.Buhgbasnum});

  Buhgdb.fromSnapshot(DataSnapshot snapshot)
      : Basname = snapshot.value["Basname"],
        Stepend = snapshot.value["Stepend"],
        DialogKew = snapshot.value["DialogKew"],
        DialogAty = snapshot.value["DialogAty"],
        DialogTus = snapshot.value["DialogTus"],
        OkyData = snapshot.value["OkyData"],
        DialogTan = snapshot.value["DialogTan"],
        OkyAky = snapshot.value["OkyAky"],
        Buhgfirstname = snapshot.value["Buhgfirstname"],
        Tamaq = snapshot.value["Tamaq"],
        TamaqData = snapshot.value["TamaqData"],
        title = snapshot.value["title"],
        Basnomer = snapshot.value["Basnomer"],
        Buhgbirnum = snapshot.value["Buhgbirnum"],
        Buhgekinum = snapshot.value["Buhgekinum"],
        Buhgsecondname = snapshot.value["Buhgsecondname"],
        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "DialogTan": DialogTan,
      "DialogTus": DialogTus,
      "Stepend": Stepend,
      "DialogKew": DialogKew,
      "DialogAty":DialogAty,
      "OkyAky": OkyAky,
      "Tamaq": Tamaq,
      "OkyData": OkyData,
      "Buhgfirstname": Buhgfirstname,
      "Buhgbasnum": Buhgbasnum,
      "Buhgbirnum": Buhgbirnum,
      "title": title,
      "Basnomer": Basnomer,
      "Buhgsecondname": Buhgsecondname,
      "Basname": Basname,
      "Buhgekinum" : Buhgekinum,
      "TamaqData": TamaqData,
    };
  }
}
