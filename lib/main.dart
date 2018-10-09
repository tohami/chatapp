import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/ChatScreen.dart';
import 'package:my_flutter_app/pages/login_page.dart';
import 'package:my_flutter_app/pages/splash_screen_page.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginPage(),
  "/chat": (BuildContext context) => ChatScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData( primarySwatch: Colors.blue,),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));