import 'package:firebase_database/firebase_database.dart';

class Uidb {
  String key;
  String Aptakun;
  String Aty;
  String Basqaruwi;
  String Basnomer;
  String url;
  String NomerZapas;
  String Basname;
  String Ui_image;
  String Buhgbasnum;
  String Nomer;
  String Uakit;
  String Nomereki;


  Uidb({this.Aptakun,this.Nomer,this.Uakit,this.Nomereki, this.Aty,this.Basqaruwi, this.Basnomer, this.url,this.Basname,this.Ui_image,this.NomerZapas,this.Buhgbasnum});

  Uidb.fromSnapshot(DataSnapshot snapshot)
      : Basname = snapshot.value["Basname"],
        Uakit = snapshot.value["Uakit"],
        Nomer = snapshot.value["Nomer"],
        Aptakun = snapshot.value["Aptakun"],
        Basqaruwi = snapshot.value["Basqaruwi"],
        Ui_image = snapshot.value["Ui_image"],
        Aty = snapshot.value["Aty"],
        Basnomer = snapshot.value["Basnomer"],

        NomerZapas = snapshot.value["NomerZapas"],
        url = snapshot.value["ulr"],
        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "Nomer": Nomer,
      "Basqaruwi": Basqaruwi,
      "Uakit": Uakit,
      "Aptakun": Aptakun,
      "Buhgbasnum": Buhgbasnum,
      "Ui_image": Ui_image,
      "Aty": Aty,
      "Basnomer": Basnomer,
      "url": url,
      "Basname": Basname,
      "NomerZapas" : NomerZapas,
      "Nomereki": Nomereki,
    };
  }
}
