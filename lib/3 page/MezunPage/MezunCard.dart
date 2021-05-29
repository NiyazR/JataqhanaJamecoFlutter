import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MezuncCard extends StatefulWidget {
  @override
  _MezuncCardState createState() => _MezuncCardState();
}

class _MezuncCardState extends State<MezuncCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: width / 9,
            backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/c0d10642ec55a60d4b425c5d0401d5a7.jpg?size=240&d=https%3A%2F%2Fwww.artstation.com%2Fassets%2Fdefault_avatar.jpg')),
        SizedBox(width: width / 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Барыбаева Дана ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width / 27,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: width / 50),
            Text(
              '1305000 - Ақпараттық жүйелер',
              style: TextStyle(
                color: Colors.black,
                fontSize: width / 27,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: width / 50),
            Text(
              '2018-2022 ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: width / 27,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
