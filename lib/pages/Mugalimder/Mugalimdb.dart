import 'package:firebase_database/firebase_database.dart';

class Mugdb{
  String key;
  String name;
  String maxname;
  String desc;
  String url;
  String image_class;
  String rating;
  String photo;

  Mugdb({this.name, this.maxname, this.desc, this.url, this.image_class, this.rating, this.photo});

  Mugdb.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        name = snapshot.value["name"],
        maxname= snapshot.value["maxname"],
        desc = snapshot.value["desc"],
        url = snapshot.value["url"],
        image_class = snapshot.value["image_class"],
        rating = snapshot.value["rating"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "name": name,
      "maxname  ": maxname,
      "desc": desc,
      "url": url,
      "image_class": image_class,
      "rating": rating,
      "photo": photo,
    };
  }
}