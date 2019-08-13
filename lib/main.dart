import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plugin_demo/pages/home_page.dart';
import 'package:flutter_plugin_demo/pages/net_json_folder/net_json_epage.dart';
import 'package:flutter_plugin_demo/pages/url_launcher_folder/url_launcher_epage.dart';
import 'package:flutter_plugin_demo/pages/welcome_page.dart';
import 'package:flutter_plugin_demo/utils/key_util.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
        backgroundColor: Colors.cyan,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: IconThemeData(color: Colors.white),
        accentIconTheme: IconThemeData(color: Colors.white),
        // dividerColor: Colors.blue,
      ),
      home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        KeyUtil.home_page: (context) => HomePage(),
        KeyUtil.welcome_page: (context) => WelcomePage(),
        KeyUtil.url_launcher_example: (context) => UrlLauncherEPage(),
        KeyUtil.net_json_example: (context) => NetJsonEPage(),
      },
    );
  }
}
