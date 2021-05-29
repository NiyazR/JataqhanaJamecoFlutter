import 'package:firebase_database/firebase_database.dart';

class mugalim{
  String key;
  String name;
  String maxname;
  String desc;
  String url;
  String image_class;
  String rating;
  String photo;

  mugalim({this.name, this.maxname, this.desc, this.url, this.image_class, this.rating, this.photo});

  mugalim.fromSnapshot(DataSnapshot snapshot) :
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