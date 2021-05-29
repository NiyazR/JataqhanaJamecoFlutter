import 'package:flutter/material.dart';
import 'package:jihc/3%20page/main3.dart';
import 'package:jihc/Login/Tanday_page.dart';

import 'package:jihc/pages/BUHGALTERYA/buhgalterya.dart';

import 'package:provider/provider.dart';

import 'Pages3/Basty.dart';
import 'MezunPage/MezunFilter2.dart';
import 'Pages3/Technolab.dart';
import 'Pages3/Tur.dart';
import 'Pages3/tarih.dart';

class DrawerMenu2 extends StatefulWidget {
  @override
  _DrawerMenu2State createState() => _DrawerMenu2State();
}

class _DrawerMenu2State extends State<DrawerMenu2> {
  @override
  Widget build(BuildContext context) {



    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return SizedBox(
    width: width/1.5,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [

           SizedBox(height: width/4),
            Container(
                margin: EdgeInsets.only(left: width/12),
                child: Text('Кіру',style: TextStyle(fontSize: width/15,fontWeight: FontWeight.bold),)),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
          child: Divider(

            color: Colors.grey
          ),
        ),


           Container(margin: EdgeInsets.only(left: width/25),
             child: Column(
               children: [
                 ListTile(

                      title: Text(
                        'Басты',
                        style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return TablePage3();
                            }));
                      },
                    ),
                 ListTile(

                   title: Text(
                     'Тарихы',
                     style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                   ),
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                           return Tarih();
                         }));
                   },
                 ),
                 ListTile(

                   title: Text(
                     'Тур',
                     style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                   ),
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                           return Tur();
                         }));
                   },
                 ),
                 ListTile(

                   title: Text(
                     'Түлектер',
                     style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                   ),
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                           return Mezun();
                         }));
                   },
                 ),
                 ListTile(

                   title: Text(
                     'Technolab',
                     style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                   ),
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                           return Technolab();
                         }));
                   },
                 ),
                 ListTile(

                   title: Text(
                     'Шығу',
                     style: TextStyle(color: Colors.black87, fontSize: width * 0.04,),
                   ),
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                           return TandayPage();
                         }));
                   },
                 ),
               ],
             ),
           ),



          ],
        ),
      ),
    );
  }
}
