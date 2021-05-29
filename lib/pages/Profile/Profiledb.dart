import 'package:firebase_database/firebase_database.dart';

class Iddb {
  String key;
  String mugalimi;
  String iid;
  String Image_muga;
  String toby;
  String atyzhoni;
  String Buhgekinum;
  String Basname;
  String iin;
  String Buhgbasnum;
  String image_class;
  String OkyData;
  String TamaqData;


  Iddb({this.mugalimi,this.image_class,this.OkyData,this.TamaqData, this.iid,this.Image_muga, this.toby, this.atyzhoni,this.Basname,this.iin,this.Buhgekinum,this.Buhgbasnum});

  Iddb.fromSnapshot(DataSnapshot snapshot)
      : Basname = snapshot.value["Basname"],
        OkyData = snapshot.value["OkyData"],
        image_class = snapshot.value["image_class"],
        mugalimi = snapshot.value["mugalimi"],
        Image_muga = snapshot.value["Image_muga"],
        TamaqData = snapshot.value["TamaqData"],
        iid = snapshot.value["iid"],
        toby = snapshot.value["toby"],
        iin= snapshot.value["iin"],
        Buhgekinum = snapshot.value["Buhgekinum"],
        atyzhoni = snapshot.value["atyzhoni"],
        Buhgbasnum = snapshot.value["Buhgbasnum"];


  toJson() {
    return {
      "image_class": image_class,
      "Image_muga": Image_muga,
      "OkyData": OkyData,
      "mugalimi":mugalimi,
      "Buhgbasnum": Buhgbasnum,
      "iin": iin,
      "iid": iid,
      "tobyr": toby,
      "atyzhoni": atyzhoni,
      "Basname": Basname,
      "Buhgekinum" : Buhgekinum,
      "TamaqData": TamaqData,
    };
  }
}
