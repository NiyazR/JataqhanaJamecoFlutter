import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MezunCard.dart';

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Іздеу..."),
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: IconButton(
                    splashColor: Colors.grey,
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.teal,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Column(
              children: [
                SizedBox(height: width / 30),
                MezuncCard(),
                Divider(
                  color: Colors.grey,
                  height: width / 15,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
