import 'package:firebase_database/firebase_database.dart';

class Newsdb{
  String key;
  String name;
  String maxname;
  String text;
  String url;
  String image_class;
  String kuni;
  String photo;

  Newsdb({this.name, this.maxname, this.text, this.url, this.image_class, this.kuni, this.photo});

  Newsdb.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        name = snapshot.value["name"],
        maxname= snapshot.value["maxname"],
        text = snapshot.value["text"],
        url = snapshot.value["url"],
        image_class = snapshot.value["image_class"],
        kuni = snapshot.value["kuni"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "name": name,
      "maxname  ": maxname,
      "text": text,
      "url": url,
      "image_class": image_class,
      "kuni": kuni,
      "photo": photo,
    };
  }
}