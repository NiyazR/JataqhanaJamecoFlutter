import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jihc/1%20page/Ashana/Ashana.dart';

import 'package:jihc/1%20page/Jatawka/Jataqhana.dart';
import 'package:jihc/1%20page/UIRME/uyirme.dart';


import 'package:jihc/pages/BUHGALTERYA/buhgalterya.dart';
import 'package:jihc/pages/Mugalimder/Mugalim_grid.dart';
import 'package:jihc/pages/News/news.dart';


import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Basty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return ListView(
      children: [
        SizedBox(height: width / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: width / 15),
                child: Text(
                  'Жаңалықтар',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width / 20),
                )),
          ],
        ),
        SizedBox(height: width / 30),
        Container(
          margin: EdgeInsets.only(left: width / 30),
          height: height / 5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 10),
                  child: SizedBox(
                    width: width / 1.5,
                    height: height / 5,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width / 45),
                          bottomLeft: Radius.circular(width / 45),
                        ),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThhV6BbSfrKD9mTl5gFEfwyv9H1QGgcTlhC94s5ckFg3cI0KR2BBhLqRTpIU35WJwc6to&usqp=CAU',
                          width: width / 3,
                          height: width / 3.75,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(
                        width: width / 1,
                        height: width / 3.72,
                        child: RaisedButton(
                          color: Colors.white.withOpacity(0.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsPagebir()),
                            );
                          },
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: width / 1,
                            height: width / 3.72,
                            child: Container(
                              decoration: BoxDecoration(

                                borderRadius:
                                BorderRadius.circular(width / 25),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight,
                                    stops: [
                                      0.0,
                                      0.5,
                                      0.9
                                    ],
                                    colors: [
                                      Colors.indigo.withOpacity(0.0),
                                      Colors.blueAccent,
                                      Colors.teal[400]
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container( margin: EdgeInsets.only(left: width / 2.8,top: width/15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            SizedBox(
                              width: width / 4,
                              child: Text(
                                'Қыздар арасындағы волейбол',
                                textAlign: TextAlign.center,
                                maxLines: 4,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width / 36),
                              ),
                            ),
                            SizedBox(height: width/100),
                            Text(
                              '    || орын',
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 20),
                            ),
                          ],
                        ),
                      ),

                    ]),
                  ),
                );
              }),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: width / 15),
                child: Text(
                  'JIHC',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width / 20),
                )),
          ],
        ),
        SizedBox(height: width / 20),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 12,
                          ),
                        ]),
                        child: Stack(
                          children: [
                            Container(
                              height: width / 2.8,
                              width: width / 2.2,
                              child: Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width / 40),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.srcOver),
                                        image: NetworkImage(
                                            'https://mir-cdn.behance.net/v1/rendition/project_modules/fs/a9920c65816853.5d02ea47e9b88.jpg'),
                                      ),
                                    ),
                                    child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 6, left: 15),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: width / 8, top: width / 9),

                              child: Column(
                                children: [
                                  Text(
                                    ' Асхана',
                                    style: TextStyle(
                                        fontSize: width / 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  МЕНЮ',
                                    style: TextStyle(
                                        fontSize: width / 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),




                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ashana()),
                    );
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 12,
                          ),
                        ]),
                        child: Stack(
                          children: [
                            Container(
                              height: width / 2.8,
                              width: width / 2.2,
                              child: Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width / 40),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.srcOver),
                                        image: NetworkImage(
                                            'https://im0-tub-kz.yandex.net/i?id=eaca0d57058cdfdf1ebc403e14b9f970&n=13&exp=1'),
                                      ),
                                    ),
                                    child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 6, left: 15),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: width / 10, top: width / 7),
                                child: Text(
                                  'Үйірмелер',
                                  style: TextStyle(
                                      fontSize: width / 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Uirme()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: width / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 12,
                          ),
                        ]),
                        child: Stack(
                          children: [
                            Container(
                              height: width / 2.8,
                              width: width / 2.2,
                              child: Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width / 40),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.srcOver),
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS78JTqHizr1mTyw3wn1ET3bLxQuJILrRVkBfCGTd8ZALj1W2mgRwEx-yz1cdafCKct8rk&usqp=CAU'),
                                      ),
                                    ),
                                    child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 6, left: 15),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: width / 10, top: width / 7),
                                child: Text(
                                  'Жатақхана',
                                  style: TextStyle(
                                      fontSize: width / 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jataqhana()),
                    );
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 12,
                          ),
                        ]),
                        child: Stack(
                          children: [
                            Container(
                              height: width / 2.8,
                              width: width / 2.2,
                              child: Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width/40),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.srcOver),
                                        image: NetworkImage(
                                            'https://thumbs.dreamstime.com/b/%D0%B1%D1%83%D1%85%D0%B3%D0%B0%D0%BB%D1%82%D0%B5%D1%80-%D1%80%D0%B0%D0%B1%D0%BE%D1%87%D0%B5%D0%B3%D0%BE-%D0%BC%D0%B5%D1%81%D1%82%D0%B0-%D0%B2-%D0%BF%D1%80%D0%BE%D1%88%D0%BB%D0%BE%D0%BC-%D1%81%D1%82%D0%BE%D0%BB%D0%B5%D1%82%D0%B8%D0%B8-%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8F%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B0%D0%B1%D0%B0%D0%BA%D1%83%D1%81-%D1%80%D1%83%D1%87%D0%BA%D0%B0-154978956.jpg'),
                                      ),
                                    ),
                                    child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 6, left: 15),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: width / 10, top: width / 7),
                                child: Text(
                                  'Бухгалтерия',
                                  style: TextStyle(
                                      fontSize: width / 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Buhgalterya()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton( style: TextButton.styleFrom(
              primary: Colors.white,

              onSurface: Colors.grey,
            ),
                child: Container(
                  margin: EdgeInsets.only(left: width / 15),
                  child: Text(
                    'Мұғалімдер',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width / 20,
                        color: Colors.black),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MugalimGrid()),
                  );
                }),
          ],
        ),

        Container(
          margin: EdgeInsets.only(left: width / 15),
          height: height / 3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 12,
                          ),
                        ]),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    width / 30),
                                child: Image.network(
                                  'https://z-taraz.kz/wp-content/uploads/2019/10/40-Nevzat-1030x883.jpg',
                                  width: width / 4,
                                  height: width / 2.85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Невзат Бекар',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width / 25),
                      ),
                    ],
                  ),
                  onTap: () async {
                    const url = 'https://podcasts.google.com/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                );
              }),
        ),
      ],
    );

  }

// This widget will be passed as Top Card's Widget.

}
