import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jihc/1%20page/Jatawka/Jataqhana.dart';
import 'package:jihc/1%20page/main1.dart';
import 'package:jihc/2%20page/main2.dart';
import 'package:jihc/3%20page/MezunPage/Mezun.dart';
import 'package:jihc/Login/Tanday_page.dart';
import 'package:jihc/Login/oper1.dart';
import 'package:jihc/pages/BUHGALTERYA/buhgalterya.dart';
import 'package:jihc/pages/BUHGALTERYA/dialogs.dart';
import 'package:jihc/pages/News/news.dart';
import 'package:jihc/pages/News/news_about.dart';

import '3 page/main3.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Jameco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
