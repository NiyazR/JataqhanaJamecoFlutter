import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jihc/3%20page/Pages3/Basty.dart';
import 'package:jihc/3%20page/DrawerMain3.dart';
import 'package:jihc/3%20page/Pages3/Technolab.dart';
import 'package:jihc/3%20page/Pages3/tarih.dart';
import 'package:search_widget/search_widget.dart';


import '../Pages3/Tur.dart';
import 'Mezun main.dart';


class Mezun extends StatefulWidget {
  @override
  _MezunState createState() => _MezunState();
}

class _MezunState extends State<Mezun>
    with SingleTickerProviderStateMixin {
  bool checkBoxVAlue1 = true;
  bool checkBoxVAlue2 = false;
  bool checkBoxVAlue3 = false;
  bool checkBoxVAlue4 = false;
  bool checkBoxVAlue5 = false;

  // define your tab controller here
  TabController _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 5, vsync: this);
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
        leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),

        iconTheme: IconThemeData(color: Colors.teal),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: width / 25),
                  child: Text(
                    "Түлектер",
                    style: TextStyle(color: Colors.black, fontSize: width / 20),
                  ),
                ),
              ],
            ),

          ],
        ),
        actions: <Widget>[ Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),],

        //<Widget>[]
        backgroundColor: Colors.white,
        elevation: 5.0,

        //IconButton
      ),

      body: FloatAppBar(),
      drawer: DrawerMenu2(),

      endDrawer: Container(width: width/1.5,
        child: new Drawer(


            child: Container(
              margin: EdgeInsets.only(left: width/30),
              child: new ListView(
                children: <Widget>[

                  SizedBox(height: width/5),
                   Text('Мамандықтар',style: TextStyle(fontSize: width/25,fontWeight: FontWeight.bold),),
                  SizedBox(height: width/20),
                  Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Transform.scale(    scale: 1,
                          child: Checkbox(
                  checkColor: Colors.white,

                            activeColor: Colors.teal,
                            value: checkBoxVAlue1,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                 checkBoxVAlue1 = value;
                              });
                            },
                          //  <-- leading Checkbox
                          ),
                        ),
                        Text('0111000 - Негізгі орта білім беру',style: TextStyle(fontSize: width/32),),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(    scale: 1,
                          child: Checkbox(
                            checkColor: Colors.white,

                            activeColor: Colors.teal,
                            value: checkBoxVAlue2,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                checkBoxVAlue2 = value;
                              });
                            },
                            //  <-- leading Checkbox
                          ),
                        ),
                        Text('0111000 - Негізгі орта білім беру',style: TextStyle(fontSize: width/32),),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(    scale: 1,
                          child: Checkbox(
                            checkColor: Colors.white,

                            activeColor: Colors.teal,
                            value: checkBoxVAlue3,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                checkBoxVAlue3 = value;
                              });
                            },
                            //  <-- leading Checkbox
                          ),
                        ),
                        Text('0111000 - Негізгі орта білім беру',style: TextStyle(fontSize: width/32),),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(    scale: 1,
                          child: Checkbox(
                            checkColor: Colors.white,

                            activeColor: Colors.teal,
                            value: checkBoxVAlue4,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                checkBoxVAlue4 = value;
                              });
                            },
                            //  <-- leading Checkbox
                          ),
                        ),
                        Text('0111000 - Негізгі орта білім беру',style: TextStyle(fontSize: width/32),),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(    scale: 1,
                          child: Checkbox(
                            checkColor: Colors.white,

                            activeColor: Colors.teal,
                            value: checkBoxVAlue5,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                checkBoxVAlue5 = value;
                              });
                            },
                            //  <-- leading Checkbox
                          ),
                        ),
                        Text('0111000 - Негізгі орта білім беру',style: TextStyle(fontSize: width/32),),
                      ],
                    ),




                  ],
                ),
                  SizedBox(height: width/20),
                  Text('Бітірген жылы',style: TextStyle(fontSize: width/25,fontWeight: FontWeight.bold),),
                  SizedBox(height: width/20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "1997",
                              "1998",
                              "1999",

                            ],
                            buttonValuesList: [
                              "1997",
                              "1998",
                              "1999",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2000",
                              "2001",
                              "2002",

                            ],
                            buttonValuesList: [
                              "2000",
                              "2001",
                              "2002",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2003",
                              "2004",
                              "2005",

                            ],
                            buttonValuesList: [
                              "2003",
                              "2004",
                              "2005",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2006",
                              "2007",
                              "2008",

                            ],
                            buttonValuesList: [
                              "2006",
                              "2007",
                              "2008",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2009",
                              "2010",
                              "2011",

                            ],
                            buttonValuesList: [
                              "2009",
                              "2010",
                              "2011",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2012",
                              "2013",
                              "2014",

                            ],
                            buttonValuesList: [
                              "2012",
                              "2013",
                              "2014",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2015",
                              "2016",
                              "2017",

                            ],
                            buttonValuesList: [
                              "2015",
                              "2016",
                              "2017",
                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2017",
                              "2018",
                              "2019",

                            ],
                            buttonValuesList: [
                              "2017",
                              "2018",
                              "2019",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "2020",
                              "2021",
                              "2022",

                            ],
                            buttonValuesList: [
                              "2020",
                              "2021",
                              "2022",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:   Container(
                          child: CustomCheckBoxGroup(
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "1997",
                              "1998",
                              "1999",

                            ],
                            buttonValuesList: [
                              "1997",
                              "Tuesday",
                              "Wednesday",

                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },

                            horizontal: false,
                            width: width/5.5,
                            // hight: 50,
                            selectedColor: Colors.teal,
                            padding: width/90,
                            spacing: 0.0,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: const ButtonTextStyle(textStyle: TextStyle(fontSize: 11.5)),


                            // enableShape: true,
                          ),
                        ),
                      ),






                    ],
                  ),
                  SizedBox(height: width/20),








                ],
              ),
            ),

        ),
      ),

    );
  }
}
