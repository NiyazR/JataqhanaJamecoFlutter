import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jihc/pages/Profile/profile.dart';



import 'ERKEK/Erkek.dart';
import 'KIZ/Kiz.dart';


class Jataqhana  extends StatefulWidget {
  @override
  _JataqhanaState createState() => _JataqhanaState();
}

class _JataqhanaState extends State<Jataqhana>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  TabController _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                IconButton(
                    icon: new Icon(
                      Icons.home_rounded,
                      size: width/15,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 25),
                  child: Text(
                    "Жатақхана",
                    style: TextStyle(color: Colors.black, fontSize: width / 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(margin: EdgeInsets.only(right: width/50),
                  child: Stack(
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                          ),
                          onPressed: () {

                          }),

                      new Container(),
                      new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.red),
                              new Positioned(
                                  top: 4.0,
                                  right: 5.0,
                                  child: new Center(
                                    child: new Text(
                                      '1',
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: width/35,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
                IconButton(
                  icon: new Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,_){
                      return SecondRoute();


                    }
                    )

                    );
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[],

        //<Widget>[]
        backgroundColor: Colors.white,
        elevation: 5.0,

        //IconButton
      ),
      body: Container(color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: width / 25),
            Container(
              margin: EdgeInsets.only(left: width / 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TabBar(

                  controller: _tabController,
                  labelColor: Colors.teal[400],
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(
                    fontSize: width / 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                  labelStyle: TextStyle(
                    fontSize: width / 25,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: width/10),
                        child: Text("Қыздар")),
                    Text('Ұлдар'),

                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[

                  Kiz(),
                  Erkek(),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
